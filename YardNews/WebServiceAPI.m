//
//  WebServiceAPI.m
//  YardNews
//
//  Created by user on 5/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WebServiceAPI.h"


@implementation WebServiceAPI
@synthesize delegate, connection, connectionData;

- (id)init {
    self = [super init];
    if (self)
        self.connectionData = [[NSMutableData alloc] init];
    return self;
}

- (void) retrieveRequestWithSomeData:(NSString*)url delegate:(id)aDelegate;
{
    // Set the WebServiceAPI delegate to the view controller
    self.delegate = aDelegate;
    /** Some code to process "foo" would go here and create an NSURLRequest **/
    
    NSURL *jURL = [[[NSURL alloc] initWithString:url] autorelease];
    NSURLRequest *jReq = [[[NSURLRequest alloc] initWithURL:jURL] autorelease];
    
    
    NSURLConnection *aConnection = [NSURLConnection connectionWithRequest:jReq delegate:self];
    // Hold on to our connection in case we need to cancel him
    self.connection = aConnection;
}

- (void) connectionDidFinishLoading:(NSURLConnection*)connection
{
    // Do any processing with the returned data - parse JSON/XML etc
    // Then store it in an instance variable of the API
    
    //connectionData = [[NSMutableData data] retain];
    
    // Tell our view controller we are done, pass "self" so clients can access the retrieved data.
    [self.delegate apiFinished:self.connectionData];
    
    [connectionData release];
}

- (void) connection:(NSURLConnection*) connection didFailWithError:(NSError*) error
{
    // Custom logic goes here before sending the error on, sending on a different error, etc.
    [self.delegate apiFailed:self failedWithError:error];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the new data to receivedData.
    // receivedData is an instance variable declared elsewhere.
    [connectionData appendData:data];
}
@end
