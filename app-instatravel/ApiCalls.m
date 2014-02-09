//
//  ApiCalls.m
//  app-instatravel
//
//  Created by Vikram Jiandani on 2/8/14.
//  Copyright (c) 2014 Vikram Jiandani. All rights reserved.
//

#import "ApiCalls.h"

@implementation ApiCalls

+ (void)getImagesByLocation:(id<APICallsDelegate>)delegate
{
    NSString *accessToken = @"56096921.f59def8.658597f3c28a470baaa1fa90fd0db88e";
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            accessToken, @"access_token",
                            nil];
    
    NSArray *locations = [NSArray arrayWithObjects:
                          @"514276",
                          nil];
    
    NSMutableArray *mutableOperations = [NSMutableArray array];
    for (NSString *location in locations) {
        NSString *url = [NSString stringWithFormat: @"https://api.instagram.com/v1/locations/%@/media/recent", location];
        
        NSURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:url parameters:params error:nil];
        
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        
        [mutableOperations addObject:operation];
    }
    
    NSArray *operations = [AFURLConnectionOperation batchOfRequestOperations:mutableOperations progressBlock:^(NSUInteger numberOfFinishedOperations, NSUInteger totalNumberOfOperations) {
        NSLog(@"%lu of %lu complete", (unsigned long)numberOfFinishedOperations, (unsigned long)totalNumberOfOperations);
    } completionBlock:^(NSArray *operations) {
        NSLog(@"All operations in batch complete");
        
        AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
        for (AFURLConnectionOperation *operation in operations) {
            NSDictionary *json = [serializer responseObjectForResponse:[operation response] data:[operation responseData] error:nil];
            NSLog(@"%@", json);
        }
    }];
    [[NSOperationQueue mainQueue] addOperations:operations waitUntilFinished:NO];
}

@end
