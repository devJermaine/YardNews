//
//  BrowserViewController.h
//  YardNews
//
//  Created by user on 4/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "BaseViewController.h"

@protocol BrowserViewControllerDelegate
- (void)closeBrowser;
@end

@interface BrowserViewController : BaseViewController <MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate> {
    UIWebView *webView;
    UINavigationBar *navBar;
    id <BrowserViewControllerDelegate> delegate;
    NSString *viewTitle, *viewUrl, *storyTitle;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UINavigationBar *navBar;
@property (nonatomic, retain) id <BrowserViewControllerDelegate> delegate;
@property (readwrite, nonatomic, retain) NSString *viewTitle, *viewUrl, *storyTitle;

-(IBAction)shareByText:(id)sender;
-(IBAction)shareByEmail:(id)sender;

@end
