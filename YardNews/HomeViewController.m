//
//  HomeViewController.m
//  JamNews
//
//  Created by user on 4/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "FeedList.h"
#import "HomeViewCell.h"
#import "BrowserViewController.h"

@implementation HomeViewController

@synthesize homeTable, activityIndicator, feedLists;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.frame = CGRectMake(0, 0, 320, 480);
        self.view.backgroundColor = [self colorForHex:@"#00FF33"];
    }
    
    feedLists = [[NSMutableArray alloc] init];
    
    return self;
}

- (void)dealloc
{
    //[feedLists release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    feedLists = [[NSMutableArray alloc] init];
    
    if (![feedLists count])
    {
        activityIndicator.hidesWhenStopped = YES;
        [activityIndicator startAnimating];
    
        WebServiceAPI *api = [[WebServiceAPI alloc] init];
        [api retrieveRequestWithSomeData:@"http://www.devred.net/newsfeed/feedservice.aspx/GetNewsSource?countryId=2" delegate:self];
        self.webApi = api;
        [api release];
    }
    
    [homeTable setRowHeight:100];
}

-(void)apiFinished:(NSData*)api
{
    NSData *jData = api;
    
    if ([jData length])
    {
        NSError *theError = NULL;
        NSArray *json = [[CJSONDeserializer deserializer] deserializeAsArray:jData error:&theError];
        
        for (int x = 0; x <= json.count - 1; x++)
        {
            NSDictionary *val = [json objectAtIndex:x];
            
            FeedList *fList = [[[FeedList alloc] init] autorelease];
            fList.feedId = [val objectForKey:@"ID"];
            fList.category = [val objectForKey:@"Category"];
            fList.description = [val objectForKey:@"Description"];
            fList.name = [val objectForKey:@"Name"];
            
            NSData *imageData = [[[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:[val objectForKey:@"Icon"]]] autorelease];
            fList.image = [[[UIImage alloc] initWithData:imageData] autorelease];
            
            [feedLists addObject:fList];
        }
        
        [homeTable reloadData];
        [activityIndicator stopAnimating];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return feedLists.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeViewCell *result = [HomeViewCell cellWithItems:[feedLists objectAtIndex:indexPath.row]];
    
    return result;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    FeedList *selItem = [[[FeedList alloc] init] autorelease];
    selItem = [feedLists objectAtIndex:indexPath.row];
    
    strURL = [NSString stringWithFormat:@"http://www.devred.net/yardnews/Home.aspx/?feedId=%@&device=ios", selItem.feedId];
    
    BrowserViewController *browser = [self.tabBarController.viewControllers objectAtIndex:1];
    [browser initWithUrl:strURL];
    [browser viewDidLoad];
    self.tabBarController.selectedViewController = browser;
}

-(void)closeBrowser
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
