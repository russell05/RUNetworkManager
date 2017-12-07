//
//  RUService.h
//  RUNetWorkManager
//
//  Created by russ on 2017/11/30.
//  Copyright © 2017年 russell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RUNetworkManager.h"
#import "RURequsts.h"

@interface RUService : NSObject

@property (nonatomic, strong) RUNetworkManager *manager;
@property (nonatomic, strong) NSMutableArray *tasks;

+ (instancetype) instance;

/*
 weather
 */

- (void) getWeatherDataWithCityName:(NSString*)cityName dtype:(NSString*)dtype format:(int)format block:(RUJsonCompletionBlock) block;


@end
