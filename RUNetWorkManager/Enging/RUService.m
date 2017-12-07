//
//  RUService.m
//  RUNetWorkManager
//
//  Created by russ on 2017/11/30.
//  Copyright © 2017年 russell. All rights reserved.
//

#import "RUService.h"

@implementation RUService

+ (instancetype) instance
{
    static RUService *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        [instance initialize];
    });
    return instance;
}

- (void) initialize
{
    _manager = [[RUNetworkManager alloc] init];
    _tasks = [NSMutableArray array];
}

#pragma mark -
#pragma mark Http methods

/*
 weather
 */

- (void) getWeatherDataWithCityName:(NSString*)cityName dtype:(NSString*)dtype format:(int)format block:(RUJsonCompletionBlock) block
{
    RUWeatherRequest *request = [[RUWeatherRequest alloc] init];
    [request sendRequestWithCityName:cityName dtype:dtype format:format block:block];
}

@end
