//
//  AFURLSessionManager+ReactiveObjc.h
//  Pods
//
//  Created by Ibnu Sina on 9/10/18.
//

#import <AFNetworking/AFNetworking.h>
@class RACSignal;

@interface AFHTTPSessionManager(ReactiveObjC)

/*!
 * A convenience around -GET:parameters:success:failure: that returns a cold signal of the
 * result.
 */
- (RACSignal *)rac_GET:(NSString *)path parameters:(NSDictionary *)parameters;

/*!
 * A convenience around -POST:parameters:success:failure: that returns a cold signal of the
 * result.
 */
- (RACSignal *)rac_POST:(NSString *)path parameters:(NSDictionary *)parameters;

/*!
 * A convenience around -PUT:parameters:success:failure: that returns a cold signal of the
 * result.
 */
- (RACSignal *)rac_PUT:(NSString *)path parameters:(NSDictionary *)parameters;

/*!
 * A convenience around -DELETE:parameters:success:failure: that returns a cold signal of the
 * result.
 */
- (RACSignal *)rac_DELETE:(NSString *)path parameters:(NSDictionary *)parameters;

/*!
 * A convenience around -PATCH:parameters:success:failure: that returns a cold signal of the
 * result.
 */
- (RACSignal *)rac_PATCH:(NSString *)path parameters:(NSDictionary *)parameters;

@end
