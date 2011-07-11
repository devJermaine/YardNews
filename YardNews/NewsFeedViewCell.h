//
//  NewsFeedViewCell.h
//  YardNews
//
//  Created by user on 5/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsFeedItem.h"


@interface NewsFeedViewCell : UITableViewCell {
    NewsFeedItem *newsItem;
    UIWebView *webView;
    UILabel *descriptionLabel, *titleLabel;
}

@property (readwrite, nonatomic, retain) NewsFeedItem *newsItem;

+(NewsFeedViewCell *)cellWithItems:(NewsFeedItem *)myNewsItem;

@end
