//
//  NewsFeedViewController.m
//  YardNews
//
//  Created by user on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "NewsFeedItem.h"
#import "NewsFeedViewController.h"
#import "NewsFeedViewCell.h"

@implementation NewsFeedViewController

@synthesize activityIndicator, navBar, delegate, newsFeedTable, feedList;

-(id) initWithFeedList:(FeedList*)value
{
    self = [super init];
    
    if (self)
    {
        self.feedList = value;
    }
    
    newsLists = [[NSMutableArray alloc] init];
    
    UIButton *button = [self buildButton:@"Close" color:[UIColor blackColor] backgroundColor:[UIColor clearColor] frame:CGRectMake(self.view.frame.size.width-60,10,50,26) font:[UIFont fontWithName:@"Helvetica" size:12] align:UIControlContentHorizontalAlignmentCenter target:self selector:@selector(closeView:)];
    [navBar addSubview:button];
    
    UINavigationItem *navItem = [[[UINavigationItem alloc] initWithTitle:feedList.name] autorelease];
    NSArray *arr = [[[NSArray alloc] initWithObjects:navItem, nil] autorelease];
    [navBar setItems:arr];
    
    WebServiceAPI *api = [[WebServiceAPI alloc] init];
    [api retrieveRequestWithSomeData:[NSString stringWithFormat:@"http://www.devred.net/newsfeed/feedservice.aspx/GetNewsFeed?newsSourceId=%@", feedList.feedId] delegate:self];
    self.webApi = api;
    [api release];
    
    return self;
}

- (void)dealloc
{
    [newsLists dealloc];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    activityIndicator.hidesWhenStopped = YES;
    [activityIndicator startAnimating];    
    
    [newsFeedTable setRowHeight:100];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)apiFinished:(NSData*)api
{
    NSData *nData = api;
    
    if ([nData length])
    {
        NSError *theError = NULL;
        NSArray *json = [[CJSONDeserializer deserializer] deserializeAsArray:nData error:&theError];
        
        int len = json.count - 1;
        
        if (len >= 0)
        {
            for (int x = 0; x <= len; x++)
            {
                NSDictionary *val = [json objectAtIndex:x];
                NSArray *items = [val objectForKey:@"Items"];
                
                if (items.count > 0)
                {
                    for (int y = 0; y <= [items count] - 1; y++) {
                        NSDictionary *iVal = [items objectAtIndex:y];
                        
                        NewsFeedItem *newsFeed = [[[NewsFeedItem alloc] init] autorelease];
                        newsFeed.link = [iVal objectForKey:@"Link"];
                        newsFeed.description = [iVal objectForKey:@"Description"];
                        newsFeed.publishDate = [iVal objectForKey:@"PublishDate"];
                        newsFeed.title = [iVal objectForKey:@"Title"];
                        newsFeed.body = [iVal objectForKey:@"Body"];
                         
                        [newsLists addObject:newsFeed];
                    }
                }
            }
        }
        else
        {
            UIAlertView *alert = [self buildAlert:@"Connection Error" message:@"There seems to be no data available!" cancelButtonTitle:@"Ok" otherButtonTitles:nil delegate:self];
            
            [alert show];
            [alert release];
        }
        
        //[json release];
        [newsFeedTable reloadData];
    }
    
    [activityIndicator stopAnimating];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return newsLists.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsFeedViewCell *result = [NewsFeedViewCell cellWithItems:[newsLists objectAtIndex:indexPath.row]];
    
    return result;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsFeedItem *newsFeed = [[[NewsFeedItem alloc] init] autorelease];
    newsFeed = [newsLists objectAtIndex:indexPath.row];
    
    DisplayViewController *display = [[[DisplayViewController alloc] init] autorelease];
    display.delegate = self;
    display.storyUrl = newsFeed.link;
    display.storyTitle = newsFeed.title;
    display.viewTitle = feedList.name;
    display.storyBody = newsFeed.description;
    
    [self presentModalViewController:display animated:YES];
}

-(void)closeBrowser
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)closeView:(id)sender
{
    [self.delegate closeBrowser];
}

@end
