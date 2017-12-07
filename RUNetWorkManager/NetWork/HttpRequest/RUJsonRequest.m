//
//  RUJsonRequest.m
//  RUNetWorkManager
//
//  Created by russ on 2017/11/24.
//  Copyright © 2017年 russell. All rights reserved.
//

#import "RUJsonRequest.h"

@implementation RUJsonRequest

#pragma mark -
#pragma mark Private method

- (NSMutableDictionary*) requiredQueries
{
    if (!_queries) {
        _queries = [NSMutableDictionary dictionary];
    }
    return _queries;
}

- (void) appendQueriWithValue:(id)value key:(NSString*)key
{
    if (value) {
        [[self requiredQueries] setObject:value forKey:key];
    }
}

- (void) appendQueries:(NSDictionary*)dic
{
    [[self requiredQueries] addEntriesFromDictionary:dic];
}

- (NSMutableDictionary*) getGeneralDictionary
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    return dic;
}

- (NSMutableDictionary*) getFinalQueries
{
    return _queries;
}

- (void) trySend
{
    NSMutableDictionary *info = nil;
    if (self.userInfo) {
        info = [self.userInfo mutableCopy];
    }
    else {
        info = [NSMutableDictionary dictionary];
    }
    [info setObject:self forKey:RU_HTTP_HANDLER];
    switch (self.type) {
        case RUHttpRequestTypeGet:
        {
            [_httpRequest get:self.url parameters:self.queries userInfo:info];
        }
            break;
        case RUHttpRequestTypePost:
        {
            [_httpRequest post:self.url parameters:self.queries userInfo:info];
        }
            break;
        case RUHttpRequestTypeUploadFile:
        {
            [_httpRequest upLoadFileWithUrl:self.url paramaters:self.queries filePath:self.filePath name:self.constructName userInfo:info];
        }
            break;
        case RUHttpRequestTypeUploadImages:
        {
            [_httpRequest upLoadImagesWithUrl:self.url name:self.constructName parameters:self.queries images:self.images imageNames:self.imageNames imageScale:self.scale imageType:self.imageType userInfo:info];
        }
            break;
        case RUHttpRequestTypeDownload:
        {
            [_httpRequest downLoadWithUrl:self.url filePath:self.fileDir userInfo:info];
        }
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma mark Object initialization

- (instancetype) init
{
    self = [super init];
    if (self) {
        _httpRequest = [RUService instance].manager.httpRequest;
    }
    return self;
}

#pragma mark -
#pragma mark RUJsonRequestDelegate

- (void) handleJsonResponse:(NSDictionary*)response
{
    if (self.block) {
        self.block(response);
    }
}

- (void) handleBadJsonResponse:(NSData*)badResponse
{
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:-1] forKey:@"code"];
    if (self.block) {
        self.block(dic);
    }
}

- (void) HandleErrorResponse:(NSError*)error
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:[NSNumber numberWithInt:-1] forKey:@"code"];
    [dic setObject:error forKey:@"error"];
    if (self.block) {
        self.block(dic);
    }
}

@end
