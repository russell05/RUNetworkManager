//
//  NSURLSessionTask+NSURLSessionTaskExtention.h
//  RUNetWorkManager
//
//  Created by russ on 2017/12/4.
//  Copyright © 2017年 russell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSURLSessionTask (NSURLSessionTaskExtention)

@property (nonatomic, strong) NSDictionary *userInfo;

@end
