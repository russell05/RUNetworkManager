//
//  RUHttpRequest.h
//  RUNetWorkManager
//
//  Created by russ on 2017/11/24.
//  Copyright © 2017年 russell. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RUHttpRequetDelegate <NSObject>

- (void) requestFinished:(NSURLSessionTask*)task responseObject:(id)responseObject;
- (void) requestFailed:(NSURLSessionTask*)task error:(NSError*)error;
- (void) requestProgress:(NSProgress*)progress;

@end

@interface RUHttpRequest : NSObject

@property (nonatomic, assign) id<RUHttpRequetDelegate>delegate;

- (void) get:(NSString*)url
  parameters:(NSDictionary*)parameters
    userInfo:(NSDictionary*)userInfo;

- (void) post:(NSString*)url
   parameters:(NSDictionary*)parameters
     userInfo:(NSDictionary*)userInfo;

- (void) upLoadFileWithUrl:(NSString*)url
                paramaters:(id)parameters
                  filePath:(NSString*)filePath
                      name:(NSString*)name
                  userInfo:(NSDictionary*)userInfo;

- (void) upLoadImagesWithUrl:(NSString*)url
                        name:(NSString*)name
                  parameters:(id)parameters
                      images:(NSArray<UIImage*>*)images
                  imageNames:(NSArray<NSString*>*)imageNames
                  imageScale:(CGFloat)imageScale
                   imageType:(NSString*)imageType
                    userInfo:(NSDictionary*)userInfo;

- (void) downLoadWithUrl:(NSString*)url
                filePath:(NSString*)filePath
                userInfo:(NSDictionary*)userInfo;

@end
