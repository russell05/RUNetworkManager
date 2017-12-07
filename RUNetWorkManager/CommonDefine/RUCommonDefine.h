//
//  RUCommonDefine.h
//  RUNetWorkManager
//
//  Created by russ on 2017/11/24.
//  Copyright © 2017年 russell. All rights reserved.
//

#ifndef RUCommonDefine_h
#define RUCommonDefine_h

#ifdef __OBJC__

#define APP_KEY_JUHE            @"10de601dfac18150c5ad565e70c46314"
#define RU_KEY                  @"key"

#define RU_API_HOST             @"http://v.juhe.cn"
#define RU_FULL_API(uri)        [RU_API_HOST stringByAppendingString:uri]

typedef void(^RUJsonCompletionBlock)(NSDictionary*);

#define RU_HTTP_HANDLER         @"http_handler"


/*
 weather
 */
#define RU_CITY_NAME            @"cityname"
#define RU_DTYPE                @"dtype"
#define RU_FORMAT               @"format"

#endif

#endif /* RUCommonDefine_h */
