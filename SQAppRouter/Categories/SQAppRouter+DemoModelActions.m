//
//  SQAppRouter+DemoModelActions.m
//  SQAppRouter
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "SQAppRouter+DemoModelActions.h"

static NSString *kSQAppRouterTargetDemoModul = @"DemoModul";
static NSString *kSQAppRouterActionNativeFetchDemoModulViewController = @"nativeFetchDemoModulViewController:";
static NSString *kSQAppRouterActionNativePresentImage = @"nativePresentImage:";
static NSString *kSQAppRouterActionNativeNoImage = @"nativeNoImage:";
static NSString *kSQAppRouterActionNativeShowAlert = @"nativeShowAlert:";

@implementation SQAppRouter (DemoModulActions)

- (UIViewController *)SQAppRouter_viewControllerForDemoModel {
    UIViewController *vc = [self performTarget:kSQAppRouterTargetDemoModul action:kSQAppRouterActionNativeFetchDemoModulViewController params:@{@"title" : @"push vc", @"imgName" : @"images_goods"}];
    if (vc) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return vc;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
    
    return vc;
}


- (void)SQAppRouter_presentImage:(UIImage *)image {
    if (image) {
        [self performTarget:kSQAppRouterTargetDemoModul action:kSQAppRouterActionNativePresentImage params:@{@"image":image}];
    } else {
        [self performTarget:kSQAppRouterTargetDemoModul action:kSQAppRouterActionNativeNoImage params:nil];
    }
}


- (void) SQAppRouter_showAlertWithMessage:(NSString *)message cancelAction:(void (^)(NSDictionary *))cancelAction confirmAction:(void (^)(NSDictionary *))confirmActiom {
    
    NSMutableDictionary *params = @{}.mutableCopy;
    if (message) {
        params[@"message"] = message;
    }
    
    if (cancelAction) {
        params[@"cancelAction"] = cancelAction;
    }
    
    if (confirmActiom) {
        params[@"confirmAction"] = confirmActiom;
    }
    
    [self performTarget:kSQAppRouterTargetDemoModul action:kSQAppRouterActionNativeShowAlert params:params];
}

@end
