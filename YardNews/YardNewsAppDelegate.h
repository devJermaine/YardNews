//
//  YardNewsAppDelegate.h
//  YardNews
//
//  Created by user on 5/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface YardNewsAppDelegate : NSObject <UIApplicationDelegate> {
    HomeViewController *myController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) HomeViewController *myController;

@end
