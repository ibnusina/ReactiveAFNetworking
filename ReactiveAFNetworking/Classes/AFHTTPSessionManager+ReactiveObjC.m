//
//  AFURLSessionManager+ReactiveObjc.m
//  Pods
//
//  Created by Ibnu Sina on 9/10/18.
//

#import "AFHTTPSessionManager+ReactiveObjC.h"
#import <ReactiveObjC/ReactiveObjC.h>

NSString *const RATaskKey = @"NSURLSessionDataTask";

@implementation AFHTTPSessionManager(ReactiveObjC)

- (RACSignal *)rac_GET:(NSString *)path parameters:(NSDictionary *)parameters
{
    return [self rac_GET:path parameters:parameters headers:nil];
}

- (RACSignal *)rac_GET:(NSString *)path parameters:(NSDictionary *)parameters headers:(NSDictionary *)headers
{
    __weak __typeof(self) weakSelf = self;
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self GET:path parameters:parameters headers:headers progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [weakSelf sendSuccessTask:task response:responseObject subscriber:subscriber];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf sendErrorTask:task error:error subscriber:subscriber];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

- (RACSignal *)rac_POST:(NSString *)path parameters:(NSDictionary *)parameters
{
    return [self rac_POST:path parameters:parameters headers:nil];
}

- (RACSignal *)rac_POST:(NSString *)path parameters:(NSDictionary *)parameters headers:(NSDictionary *)headers
{
    __weak __typeof(self) weakSelf = self;
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self POST:path parameters:parameters headers:headers progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [weakSelf sendSuccessTask:task response:responseObject subscriber:subscriber];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf sendErrorTask:task error:error subscriber:subscriber];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];

}

- (RACSignal *)rac_PUT:(NSString *)path parameters:(NSDictionary *)parameters
{
    return [self rac_PUT:path parameters:parameters headers:nil];
}

- (RACSignal *)rac_PUT:(NSString *)path parameters:(NSDictionary *)parameters headers:(NSDictionary *)headers
{
    __weak __typeof(self) weakSelf = self;
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self PUT:path parameters:parameters headers:headers success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [weakSelf sendSuccessTask:task response:responseObject subscriber:subscriber];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf sendErrorTask:task error:error subscriber:subscriber];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

- (RACSignal *)rac_DELETE:(NSString *)path parameters:(NSDictionary *)parameters
{
    return [self rac_DELETE:path parameters:parameters headers:nil];
}

- (RACSignal *)rac_DELETE:(NSString *)path parameters:(NSDictionary *)parameters headers:(NSDictionary *)headers
{
    __weak __typeof(self) weakSelf = self;
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self DELETE:path parameters:parameters headers:headers success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [weakSelf sendSuccessTask:task response:responseObject subscriber:subscriber];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf sendErrorTask:task error:error subscriber:subscriber];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

- (RACSignal *)rac_PATCH:(NSString *)path parameters:(NSDictionary *)parameters
{
    return [self rac_PATCH:path parameters:parameters headers:nil];
}

- (RACSignal *)rac_PATCH:(NSString *)path parameters:(NSDictionary *)parameters headers:(NSDictionary *)headers
{
    __weak __typeof(self) weakSelf = self;
    return [RACSignal createSignal:^(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *task = [self PATCH:path parameters:parameters headers:headers success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [weakSelf sendSuccessTask:task response:responseObject subscriber:subscriber];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [weakSelf sendErrorTask:task error:error subscriber:subscriber];
        }];
        return [RACDisposable disposableWithBlock:^{
            [task cancel];
        }];
    }];
}

#pragma mark - private methods

- (void)sendSuccessTask:(NSURLSessionDataTask *)task
               response:(id)response
             subscriber:(id<RACSubscriber>) subscriber
{
    [subscriber sendNext:RACTuplePack(task, response)];
    [subscriber sendCompleted];
}

- (void)sendErrorTask:(NSURLSessionDataTask *)task
                error:(NSError *)error
           subscriber:(id<RACSubscriber>) subscriber
{
    NSMutableDictionary *userInfo = [error.userInfo mutableCopy] ?: [NSMutableDictionary dictionary];
    userInfo[RATaskKey] = task;
    [subscriber sendError:[NSError errorWithDomain:error.domain code:error.code userInfo:userInfo]];
}

@end
