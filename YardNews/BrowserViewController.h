//
//  BrowserViewController.h
//  YardNews
//
//  Created by user on 4/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface BrowserViewController : BaseViewController {
    UIWebView *webView;
    //NSString *viewUrl;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
//@property (readwrite, nonatomic, retain) NSString *viewUrl;

- (id)initWithUrl:(NSString*)url;

@end
