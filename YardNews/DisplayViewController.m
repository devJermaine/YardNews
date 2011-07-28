//
//  DisplayViewController.m
//  YardNews
//
//  Created by jmccarthy on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DisplayViewController.h"


@implementation DisplayViewController

@synthesize navBar, displayText, delegate, storyBody, storyUrl, storyTitle, viewTitle, titleLabel, btnOnline;

-(id)init
{
    self = [super init];
    if (self)
    {
        
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
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
    
    UIButton *button = [self buildButton:@"Close" color:[UIColor blackColor] backgroundColor:[UIColor clearColor] frame:CGRectMake(self.view.frame.size.width-60,10,50,26) font:[UIFont fontWithName:@"Helvetica" size:12] align:UIControlContentHorizontalAlignmentCenter target:self selector:@selector(closeView:)];
    [navBar addSubview:button];
    
    UINavigationItem *navItem = [[[UINavigationItem alloc] initWithTitle:self.viewTitle] autorelease];
    NSArray *arr = [[[NSArray alloc] initWithObjects:navItem, nil] autorelease];
    [navBar setItems:arr];
    
    self.displayText.text = self.storyBody;
    self.titleLabel.text = self.storyTitle;
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

-(void)closeBrowser
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)closeView:(id)sender
{
    [self.delegate closeBrowser];
}

- (IBAction)goOnline:(id)sender
{
    BrowserViewController *browser = [[[BrowserViewController alloc] init] autorelease];
    browser.delegate = self;
    browser.viewUrl = self.storyUrl;
    browser.viewTitle = self.viewTitle;
    browser.storyTitle = self.storyTitle;
    
    [self presentModalViewController:browser animated:YES];
}

@end
