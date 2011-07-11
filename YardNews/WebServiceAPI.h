//
//  WebServiceAPI.h
//  YardNews
//
//  Created by user on 5/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol WebServiceAPIDelegate
-(void)apiFinished:(NSObject*)api;
-(void)apiFailed:(NSObject*)api failedWithError:(NSError*)error;
@end

@interface WebServiceAPI : NSObject 
{
    id <WebServiceAPIDelegate>delegate;
    NSURLConnection *connection;
    NSHTTPURLResponse *response;
	NSMutableData *connectionData;
}

@property (nonatomic, retain) NSMutableData *connectionData;
@property (nonatomic, retain) id <WebServiceAPIDelegate>delegate;
@property (nonatomic, retain) NSURLConnection *connection;

- (void) retrieveRequestWithSomeData:(NSString*)url delegate:(id)aDelegate;
@end
