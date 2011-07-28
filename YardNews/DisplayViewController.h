//
//  DisplayViewController.h
//  YardNews
//
//  Created by jmccarthy on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "BrowserViewController.h"

@protocol DisplayViewControllerDelegate
- (void)closeBrowser;
@end

@interface DisplayViewController : BaseViewController <BrowserViewControllerDelegate>
{
    UINavigationBar *navBar;
    UITextView *displayText;
    
    id <DisplayViewControllerDelegate> delegate;
}

@property (nonatomic, retain) IBOutlet UINavigationBar *navBar;
@property (nonatomic, retain) IBOutlet UITextView *displayText;
@property (nonatomic, retain) IBOutlet UIButton *btnOnline;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) id <DisplayViewControllerDelegate> delegate;

@property (nonatomic, retain) NSString *storyUrl, *storyTitle, *viewTitle, *storyBody;

- (IBAction)goOnline:(id)sender;

@end
