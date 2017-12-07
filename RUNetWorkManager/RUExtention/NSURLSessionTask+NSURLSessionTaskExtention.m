//
//  NSURLSessionTask+NSURLSessionTaskExtention.m
//  RUNetWorkManager
//
//  Created by russ on 2017/12/4.
//  Copyright © 2017年 russell. All rights reserved.
//

#import "NSURLSessionTask+NSURLSessionTaskExtention.h"

@implementation NSURLSessionTask (NSURLSessionTaskExtention)

- (NSDictionary *) userInfo
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void) setUserInfo:(NSDictionary *)userInfo
{
    objc_setAssociatedObject(self, @selector(userInfo), userInfo, OBJC_ASSOCIATION_RETAIN);
}

@end
