//
//  RUWeatherRequest.m
//  RUNetWorkManager
//
//  Created by russ on 2017/12/5.
//  Copyright © 2017年 russell. All rights reserved.
//

#import "RUWeatherRequest.h"

@implementation RUWeatherRequest

- (void) sendRequestWithCityName:(NSString*)cityName dtype:(NSString*)dtype format:(int)format block:(RUJsonCompletionBlock) block
{
    self.url = URI_WEATHER;
    self.block = block;
    self.type = RUHttpRequestTypeGet;
    [self appendQueriWithValue:cityName key:RU_CITY_NAME];
    [self appendQueriWithValue:dtype key:RU_DTYPE];
    [self appendQueriWithValue:[NSNumber numberWithInt:format] key:RU_FORMAT];
    [self appendQueriWithValue:APP_KEY_JUHE key:RU_KEY];
    [self trySend];
}

@end
