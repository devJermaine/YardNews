//
//  SecondViewController.m
//  YardNews
//
//  Created by jmccarthy on 12/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [super dealloc];
}

- (IBAction)submitSite:(id)sender
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
    NSString *subject;
    subject = @"YardNews: New Site Request";
    
    NSArray *arr = [NSArray arrayWithObject:@"yardnews@devred.net"];
    
	// Spark up the email view
	MFMailComposeViewController *mailController = [[[MFMailComposeViewController alloc] init] autorelease];
	mailController.mailComposeDelegate = self;
	mailController.modalPresentationStyle = UIModalPresentationFormSheet;
    [mailController setToRecipients:arr];
    [mailController setSubject:subject];
    [mailController setMessageBody:@"Site to add: " isHTML:NO];
    [mailController setEditing:YES];
    [self presentModalViewController:mailController animated:YES];
}

- (IBAction)submitError:(id)sender
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
    NSString *subject;
    subject = @"YardNews: Error";
    
    NSArray *arr = [NSArray arrayWithObject:@"yardnews@devred.net"];
    
	// Spark up the email view
	MFMailComposeViewController *mailController = [[[MFMailComposeViewController alloc] init] autorelease];
	mailController.mailComposeDelegate = self;
	mailController.modalPresentationStyle = UIModalPresentationFormSheet;
    [mailController setToRecipients:arr];
    [mailController setSubject:subject];
    [mailController setMessageBody:@"Error encountered: " isHTML:NO];
    [mailController setEditing:YES];
    [self presentModalViewController:mailController animated:YES];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
