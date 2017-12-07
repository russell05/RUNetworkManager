//
//  RUNetworkManager.h
//  RUNetWorkManager
//
//  Created by russ on 2017/11/24.
//  Copyright © 2017年 russell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RUHttpRequest.h"

@interface RUNetworkManager : NSObject <RUHttpRequetDelegate>

@property (nonatomic, strong) RUHttpRequest *httpRequest;

@end
