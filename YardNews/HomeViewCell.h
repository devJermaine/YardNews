//
//  HomeViewCell.h
//  YardNews
//
//  Created by user on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedList.h"

@interface HomeViewCell : UITableViewCell {
    
    FeedList *listItem;
    UIImageView *iconImage;
    UILabel *descriptionLabel, *titleLabel;
}

@property (readwrite, nonatomic, retain) FeedList *listItem;

+(HomeViewCell *)cellWithItems:(FeedList *)myListItem;

@end
