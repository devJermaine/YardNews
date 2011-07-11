//
//  NewsFeedViewController.h
//  YardNews
//
//  Created by user on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "BrowserViewController.h"
#import "FeedList.h"

@protocol NewsFeedViewControllerDelegate
- (void)closeBrowser;
@end

@interface NewsFeedViewController : BaseViewController <BrowserViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>
{
    UIActivityIndicatorView *activityIndicator;
    UINavigationBar *navBar;
    id <NewsFeedViewControllerDelegate> delegate;
    UITableView *newsFeedTable;
    FeedList *feedList;
    NSMutableArray *newsLists;
}

@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, retain) IBOutlet UINavigationBar *navBar;
@property (nonatomic, retain) id <NewsFeedViewControllerDelegate> delegate;
@property (nonatomic, retain) IBOutlet UITableView *newsFeedTable;
@property (nonatomic, retain) FeedList *feedList;

-(id) initWithFeedList:(FeedList*)value;

@end
