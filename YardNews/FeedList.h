//
//  KHEFeedList.h
//  YardNews
//
//  Created by user on 4/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedList : NSObject {
    NSString *category, *description, *name, *feedId;
    UIImage *image;
}

@property (nonatomic, retain) NSString *category, *description, *name, *feedId;
@property (nonatomic, retain) UIImage *image;

@end
