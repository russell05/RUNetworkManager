//
//  RUJsonRequest.h
//  RUNetWorkManager
//
//  Created by russ on 2017/11/24.
//  Copyright © 2017年 russell. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    RUHttpRequestTypeGet,
    RUHttpRequestTypePost,
    RUHttpRequestTypeUploadFile,
    RUHttpRequestTypeUploadImages,
    RUHttpRequestTypeDownload,
}RUHttpRequestType;

@protocol RUJsonRequestDelegate <NSObject>

- (void) handleJsonResponse:(NSDictionary*)response;
- (void) handleBadJsonResponse:(NSData*)badResponse;
- (void) HandleErrorResponse:(NSError*)error;

@end

@interface RUJsonRequest : NSObject <RUJsonRequestDelegate>

@property (nonatomic, weak) RUHttpRequest *httpRequest;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) NSMutableDictionary *userInfo;
@property (nonatomic, assign) RUHttpRequestType type;
@property (nonatomic, strong) NSMutableDictionary *queries;
@property (nonatomic, copy) RUJsonCompletionBlock block;

/*
 upload file
 */
@property (nonatomic, copy) NSString *filePath;
@property (nonatomic, copy) NSString *constructName;

/*
 upload images
 */
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, strong) NSArray *imageNames;
@property (nonatomic, copy) NSString *imageType;

/*
 downLoad
 */
@property (nonatomic, copy) NSString *fileDir;

- (NSMutableDictionary*) requiredQueries;
- (void) appendQueriWithValue:(id)value key:(NSString*)key;
- (void) appendQueries:(NSDictionary*)dic;
- (NSMutableDictionary*) getGeneralDictionary;
- (NSMutableDictionary*) getFinalQueries;
- (void) trySend;

@end
