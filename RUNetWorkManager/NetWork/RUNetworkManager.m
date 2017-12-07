//
//  RUNetworkManager.m
//  RUNetWorkManager
//
//  Created by russ on 2017/11/24.
//  Copyright © 2017年 russell. All rights reserved.
//

#import "RUNetworkManager.h"
#import "RUJsonRequest.h"

@implementation RUNetworkManager

#pragma mark -
#pragma mark Private method

- (void) handleJsonResponse:(NSDictionary*)dic userInfo:(NSDictionary*)userInfo
{
    id <RUJsonRequestDelegate> delegate = [userInfo objectForKey:RU_HTTP_HANDLER];
    if (delegate && [delegate respondsToSelector:@selector(handleJsonResponse:)]) {
        [delegate handleJsonResponse:dic];
    }
}

- (void) handleBadJsonResponse:(NSData*)data userInfo:(NSDictionary*)userInfo
{
    id <RUJsonRequestDelegate> delegate = [userInfo objectForKey:RU_HTTP_HANDLER];
    if (delegate && [delegate respondsToSelector:@selector(handleBadJsonResponse:)]) {
        [delegate handleBadJsonResponse:data];
    }
}

- (void) handleError:(NSError*)error userInfo:(NSDictionary*)userInfo
{
    id <RUJsonRequestDelegate> delegate = [userInfo objectForKey:RU_HTTP_HANDLER];
    if (delegate && [delegate respondsToSelector:@selector(HandleErrorResponse:)]) {
        [delegate HandleErrorResponse:error];
    }
}

#pragma mark -
#pragma mark Object initialization

- (instancetype) init
{
    self = [super init];
    if (self) {
        _httpRequest = [[RUHttpRequest alloc] init];
        _httpRequest.delegate = self;
    }
    return self;
}

#pragma mark -
#pragma mark RUHttpRequestDelegate

- (void) requestFinished:(NSURLSessionTask*)task responseObject:(id)responseObject
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDictionary *userInfo = task.userInfo;
        @try {
            NSError *error = nil;
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (error) {
                    [self handleError:error userInfo:userInfo];
                }
                else {
                    [self handleJsonResponse:dic userInfo:userInfo];
                }
            });
        }
        @catch (NSException *exception) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self handleBadJsonResponse:responseObject userInfo:userInfo];
            });
        }
    });
}

- (void) requestFailed:(NSURLSessionTask*)task error:(NSError*)error
{
    NSDictionary *userInfo = task.userInfo;
    [self handleError:error userInfo:userInfo];
}

- (void) requestProgress:(NSProgress*)progress
{
    
}

@end
