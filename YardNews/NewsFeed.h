//
//  NewsFeed.h
//  YardNews
//
//  Created by user on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsFeed : NSObject {
    NSString *link, *description, *publishDate, *title;
    NSArray *items;
}

@property (nonatomic, retain) NSString *link, *description, *publishDate, *title;
@property (nonatomic, retain) NSArray *items;

@end
