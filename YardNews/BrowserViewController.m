//
//  BrowserViewController.m
//  YardNews
//
//  Created by user on 4/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BrowserViewController.h"

@implementation BrowserViewController

@synthesize webView, navBar, delegate, viewTitle, viewUrl, storyTitle;

- (id)init
{
    self = [self initWithNibName:@"BrowserViewController" bundle:[NSBundle mainBundle]];
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
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
    [super viewDidLoadWithoutAd];
    // Do any additional setup after loading the view from its nib.
    
    //Add Buttons
    //UIButton *byEmail = [self buildButton:@"Share by Text" color:nil backgroundColor:nil frame:CGRectMake(20, 424, 130, 31) font:[UIFont fontWithName:@"Helvetica" size:12] align:UIControlContentHorizontalAlignmentCenter target:self selector:@selector(shareByText:)];
    //[self.view addSubview:byEmail];
    
    NSURL *nsurl = [NSURL URLWithString:self.viewUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:nsurl];
    
    [webView loadRequest:request];
    
    UIButton *button = [self buildButton:@"Close" color:[UIColor blackColor] backgroundColor:[UIColor clearColor] frame:CGRectMake(self.view.frame.size.width-60,10,50,26) font:[UIFont fontWithName:@"Helvetica" size:12] align:UIControlContentHorizontalAlignmentCenter target:self selector:@selector(closeBrowser:)];
    [navBar addSubview:button];
    
    UINavigationItem *navTitle = [[[UINavigationItem alloc] initWithTitle:self.viewTitle] autorelease];
    
    NSArray *arr = [[[NSArray alloc] initWithObjects:navTitle, nil] autorelease];
    [navBar setItems:arr];
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

- (void)closeBrowser:(id)sender
{
    [self.delegate closeBrowser];
}

-(IBAction)shareByText:(id)sender
{
    if ([MFMessageComposeViewController canSendText] == NO) {
        NSString *title = NSLocalizedString(@"Unable to Send SMS Message", @"SMS not configured title");
		NSString *message = NSLocalizedString(@"This device is not configured for SMS.", @"SMS not configured title");
		UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:NSLocalizedString(@"OK",@"OK Button") otherButtonTitles:nil] autorelease];
		[alert show];
		return;
    }
    
    MFMessageComposeViewController *messageController = [[[MFMessageComposeViewController alloc] init] autorelease];
    messageController.messageComposeDelegate = self;
    messageController.modalPresentationStyle = UIModalPresentationFormSheet;
    [messageController setBody:[NSString stringWithFormat:@"YardNews: %@", viewUrl]];
    [messageController setEditing:YES];
    [self presentModalViewController:messageController animated:YES];
}

-(IBAction)shareByEmail:(id)sender
{
    // Sanity check - is email configured?
	if ([MFMailComposeViewController canSendMail] == NO)	{
		NSString *title = NSLocalizedString(@"Unable to Send eMail", @"eMail not configured title");
		NSString *message = NSLocalizedString(@"Please configure at least one email account on your device.", @"eMail not configured message");
		UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:NSLocalizedString(@"OK",@"OK Button") otherButtonTitles:nil] autorelease];
		[alert show];
		return;
	}
	
    //Generate Message
    NSString *subject, *msgBody;
    subject = [NSString stringWithFormat:@"YardNews: %@", storyTitle];
    msgBody = [NSString stringWithFormat:@"Check out this story I read using YardNews:<BR> %@", viewUrl];
    
	// Spark up the email view
	MFMailComposeViewController *mailController = [[[MFMailComposeViewController alloc] init] autorelease];
	mailController.mailComposeDelegate = self;
	mailController.modalPresentationStyle = UIModalPresentationFormSheet;
    [mailController setSubject:subject];
    [mailController setMessageBody:msgBody isHTML:YES];
    [mailController setEditing:YES];
    [self presentModalViewController:mailController animated:YES];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
