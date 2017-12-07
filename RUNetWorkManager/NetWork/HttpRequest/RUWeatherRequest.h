//
//  RUWeatherRequest.h
//  RUNetWorkManager
//
//  Created by russ on 2017/12/5.
//  Copyright © 2017年 russell. All rights reserved.
//

#import "RUJsonRequest.h"

@interface RUWeatherRequest : RUJsonRequest

- (void) sendRequestWithCityName:(NSString*)cityName dtype:(NSString*)dtype format:(int)format block:(RUJsonCompletionBlock) block;

@end
