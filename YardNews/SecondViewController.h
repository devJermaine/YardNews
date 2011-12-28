//
//  SecondViewController.h
//  YardNews
//
//  Created by jmccarthy on 12/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "BaseViewController.h"


@interface SecondViewController : BaseViewController <MFMailComposeViewControllerDelegate> {
    
}

- (IBAction)submitSite:(id)sender;
- (IBAction)submitError:(id)sender;

@end
