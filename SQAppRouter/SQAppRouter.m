//
//  SQAppRouter.m
//  SQAppRouter
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "SQAppRouter.h"

@implementation SQAppRouter

+ (instancetype) sharedRouter {
    static SQAppRouter *mediator = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[SQAppRouter alloc] init];
    });
    
    return mediator;
}

- (id) performActionWithURL:(NSURL *)url comletionHandler:(void (^)(NSDictionary *))handler {
    
    if (![url.scheme isEqualToString:@"hylh"]) { // 当前app的scheme
        return @(NO);
    }
    
    // 过滤远程app调用本地native接口,防止黑客通过远程Url调用本地的私密页面
    NSString *actionName= [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    if ([actionName hasPrefix:@"native"]) {
        return @(NO);
    }
    
    NSMutableDictionary *paramsDict = @{}.mutableCopy;
    NSArray *paramsArr = [url.query componentsSeparatedByString:@"&"];
    for (NSString *param in paramsArr) {
        NSArray *params = [param componentsSeparatedByString:@"="];
        if (params.count > 1) {
            paramsDict[params[0]] = params[1];
        }
    }
    
    id result = [self performTarget:url.host action:actionName params:paramsDict];
    if (handler) {
        result ? handler(@{@"result" : result}) : handler(nil);
    }
    
    return result;
}

- (id) performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params {
    NSString *targetNameStr = [NSString stringWithFormat:@"Target_%@", targetName];
    NSString *actionNameStr = [NSString stringWithFormat:@"Action_%@", actionName];
    
    Class targetCls = NSClassFromString(targetNameStr);
    id target  = [[targetCls alloc] init];
    SEL action = NSSelectorFromString(actionNameStr);
    
    if (!target) { // obj对象不存在
        // 这里是处理无响应请求的地方之一。在这里可以事先给一个固定的target专门用于在这个时候顶上，然后处理这种请求
        return nil;
    }
    
    if ([target respondsToSelector:action]) {
        
        IMP actionImp = [target methodForSelector:action];
        id (*function) (id, SEL, id) = (void *) actionImp;
        return function(target, action, params);
    } else {
        // 这里是处理无响应请求的地方，如果无响应，则尝试调用对应target的notFound方法统一处理,
        SEL action = NSSelectorFromString(@"notFound:");
        if ([target respondsToSelector:action]) {
            
            IMP actionImp = [target methodForSelector:action];
            id (*function) (id, SEL, id) = (void *) actionImp;
            return function(target, action, params);
        } else { // 如果target没有实现notFound方法
        
            // 这里也是处理无响应请求的地方，在notFound都没有的时候，这个demo是直接return了。实际开发过程中，可以用前面提到的固定的target顶上的。
            return nil;
        }
    }
}

@end
