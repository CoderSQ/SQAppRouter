//
//  Target_DemoModel.m
//  SQAppMediator
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "Target_DemoModul.h"
#import "DemoModelViewController.h"

typedef void(^SQAppMediatorCallBack)(NSDictionary *info);

@implementation Target_DemoModul

- (UIViewController *)Action_nativeFetchDemoModulViewController:(NSDictionary *)params {
    
    DemoModelViewController *demoVC = [[DemoModelViewController alloc] init];
    demoVC.titleLabel.text = params[@"title"];
    demoVC.imgView.image = [UIImage imageNamed:params[@"imgName"]];
    
    return demoVC;
}

- (id)Action_nativePresentImage:(NSDictionary *)params {
    DemoModelViewController *demoVC = [[DemoModelViewController alloc] init];
    demoVC.titleLabel.text = @"showImage";
    demoVC.imgView.image = params[@"image"];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:demoVC animated:YES completion:nil];
    return nil;
}

- (id)Action_nativeNoImage:(NSDictionary *)params {
    DemoModelViewController *demoVC = [[DemoModelViewController alloc] init];
    demoVC.titleLabel.text = @"NoImage";
    demoVC.imgView.image = [UIImage imageNamed:@"check"];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:demoVC animated:YES completion:nil];
    return nil;
}

- (id)Action_nativeShowAlert:(NSDictionary *)params {
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        SQAppMediatorCallBack callBack = params[@"cancelAction"];
        if (callBack) {
            callBack(@{@"alertAction":action});
        }
    }];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        SQAppMediatorCallBack callBack = params[@"confirmAction"];
        if (callBack) {
            callBack(@{@"confirmAction" : action});
        }
    }];
    
    UIAlertController *ctrl = [UIAlertController alertControllerWithTitle:@"Alert From DemoModul" message:params[@"message"] preferredStyle:UIAlertControllerStyleAlert];
    [ctrl addAction:cancel];
    [ctrl addAction:confirm];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:ctrl animated:YES completion:nil];
    return nil;
}
@end
