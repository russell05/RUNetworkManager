//
//  RUHttpRequest.m
//  RUNetWorkManager
//
//  Created by russ on 2017/11/24.
//  Copyright © 2017年 russell. All rights reserved.
//

#import "RUHttpRequest.h"

@implementation RUHttpRequest

- (void) get:(NSString*)url
  parameters:(NSDictionary*)parameters
    userInfo:(NSDictionary*)userInfo
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    manager.securityPolicy.validatesDomainName = YES;
    manager.securityPolicy.allowInvalidCertificates = YES;
    NSURLSessionTask *sessionTask = [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[RUService instance].tasks removeObject:task];
        if (_delegate && [_delegate respondsToSelector:@selector(requestFinished:responseObject:)]) {
            [_delegate requestFinished:task responseObject:responseObject];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[RUService instance].tasks removeObject:task];
        if (_delegate && [_delegate respondsToSelector:@selector(requestFailed:error:)]) {
            [_delegate requestFailed:task error:error];
        }
    }];
    sessionTask.userInfo = userInfo;
    [[RUService instance].tasks addObject:sessionTask];
}

- (void) post:(NSString*)url
   parameters:(NSDictionary*)parameters
     userInfo:(NSDictionary*)userInfo
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    manager.securityPolicy.validatesDomainName = YES;
    manager.securityPolicy.allowInvalidCertificates = YES;
    NSURLSessionTask *sessionTask = [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[RUService instance].tasks removeObject:task];
        if (_delegate && [_delegate respondsToSelector:@selector(requestFinished:responseObject:)]) {
            [_delegate requestFinished:task responseObject:responseObject];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[RUService instance].tasks removeObject:task];
        if (_delegate && [_delegate respondsToSelector:@selector(requestFailed:error:)]) {
            [_delegate requestFailed:task error:error];
        }
    }];
    sessionTask.userInfo = userInfo;
    [[RUService instance].tasks addObject:sessionTask];
}

- (void) upLoadFileWithUrl:(NSString*)url
                paramaters:(id)parameters
                  filePath:(NSString*)filePath
                      name:(NSString*)name
                  userInfo:(NSDictionary*)userInfo
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    manager.securityPolicy.validatesDomainName = YES;
    manager.securityPolicy.allowInvalidCertificates = YES;
    NSURLSessionTask *sessionTask = [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSError *error;
        [formData appendPartWithFileURL:[NSURL URLWithString:filePath] name:name error:&error];
        if (error) {
            NSLog(@"appendError:%@", error);
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (_delegate && [_delegate respondsToSelector:@selector(requestProgress:)]) {
            [_delegate requestProgress:uploadProgress];
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[RUService instance].tasks removeObject:task];
        if (_delegate && [_delegate respondsToSelector:@selector(requestFinished:responseObject:)]) {
            [_delegate requestFinished:task responseObject:responseObject];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[RUService instance].tasks removeObject:task];
        if (_delegate && [_delegate respondsToSelector:@selector(requestFailed:error:)]) {
            [_delegate requestFailed:task error:error];
        }
    }];
    sessionTask.userInfo = userInfo;
    [[RUService instance].tasks addObject:sessionTask];
}

- (void) upLoadImagesWithUrl:(NSString*)url
                        name:(NSString*)name
                  parameters:(id)parameters
                      images:(NSArray<UIImage*>*)images
                  imageNames:(NSArray<NSString*>*)imageNames
                  imageScale:(CGFloat)imageScale
                   imageType:(NSString*)imageType
                    userInfo:(NSDictionary*)userInfo
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    manager.securityPolicy.validatesDomainName = YES;
    manager.securityPolicy.allowInvalidCertificates = YES;
    NSURLSessionTask *sessionTask = [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i = 0; i < images.count; i++) {
            NSData *data = UIImageJPEGRepresentation([images objectAtIndex:i], imageScale?imageScale:1.0f);
            [formData appendPartWithFileData:data name:name fileName:[imageNames objectAtIndex:i] mimeType:[NSString stringWithFormat:@"image/%@", imageType?imageType:@"jpg"]];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (_delegate && [_delegate respondsToSelector:@selector(requestProgress:)]) {
            [_delegate requestProgress:uploadProgress];
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[RUService instance].tasks removeObject:task];
        if (_delegate && [_delegate respondsToSelector:@selector(requestFinished:responseObject:)]) {
            [_delegate requestFinished:task responseObject:responseObject];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[RUService instance].tasks removeObject:task];
        if (_delegate && [_delegate respondsToSelector:@selector(requestFailed:error:)]) {
            [_delegate requestFailed:task error:error];
        }
    }];
    sessionTask.userInfo = userInfo;
    [[RUService instance].tasks addObject:sessionTask];
}

- (void) downLoadWithUrl:(NSString*)url
                filePath:(NSString*)filePath
                userInfo:(NSDictionary*)userInfo
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.requestSerializer = [[AFHTTPRequestSerializer alloc] init];
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    manager.securityPolicy.validatesDomainName = YES;
    manager.securityPolicy.allowInvalidCertificates = YES;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    __block NSURLSessionDownloadTask *sessionTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        if (_delegate && [_delegate respondsToSelector:@selector(requestProgress:)]) {
            [_delegate requestProgress:downloadProgress];
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSString *dir = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:filePath?filePath:@"Download"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:nil];
        NSString *finalPath = [dir stringByAppendingPathComponent:response.suggestedFilename];
        return [NSURL URLWithString:finalPath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        [[RUService instance].tasks removeObject:sessionTask];
        if (error && _delegate && [_delegate respondsToSelector:@selector(requestFailed:error:)]) {
            [_delegate requestFailed:sessionTask error:error];
        }
        if (_delegate && [_delegate respondsToSelector:@selector(requestFinished:responseObject:)]) {
            NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
            [mutDic setObject:response forKey:@"response"];
            [mutDic setObject:filePath forKey:@"filePath"];
            NSData *data = [NSJSONSerialization dataWithJSONObject:mutDic options:NSJSONWritingPrettyPrinted error:nil];
            [_delegate requestFinished:sessionTask responseObject:data];
        }
    }];
    sessionTask.userInfo = userInfo;
    [[RUService instance].tasks addObject:sessionTask];
    [sessionTask resume];
}

@end
