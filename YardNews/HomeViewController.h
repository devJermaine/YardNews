//
//  HomeViewController.h
//  JamNews
//
//  Created by user on 4/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface HomeViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *feedLists;
    UITableView *homeTable;
    UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic, retain) NSMutableArray *feedLists;
@property (nonatomic, retain) IBOutlet UITableView *homeTable;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
