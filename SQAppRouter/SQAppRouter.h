//
//  SQAppRouter.h
//  SQAppRouter
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQAppRouter : NSObject

+ (instancetype) sharedRouter;

/*
 url sample:
 hylh://targetA/actionB?id=1234
 */
/** 远程api调用入口 */
- (id) performActionWithURL:(NSURL *)url comletionHandler:(void(^)(NSDictionary *dict) )handler;

/** 本地api调用入口*/
- (id) performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params;
@end
