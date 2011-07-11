//
//  NewsFeedItem.h
//  YardNews
//
//  Created by user on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NewsFeedItem : NSObject {
    NSString *link, *description, *publishDate, *title, *body;
}

@property (nonatomic, retain) NSString *link, *description, *publishDate, *title, *body;

@end
