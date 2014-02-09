//
//  ApiCalls.h
//  app-instatravel
//
//  Created by Vikram Jiandani on 2/8/14.
//  Copyright (c) 2014 Vikram Jiandani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@protocol APICallsDelegate <NSObject>

@optional

- (void)handleResponseData:(id)JSON requestType:(NSString*)requestType;
- (void)handleFailedResponse:(id)JSON requestType:(NSString*)requestType;

@end

@interface ApiCalls : NSObject

+ (void)getImagesByLocation:(id<APICallsDelegate>)delegate;

@end
