//
//  SQAppRouter+DemoModelActions.h
//  SQAppRouter
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "SQAppRouter.h"
#import <UIKit/UIKit.h>

@interface SQAppRouter (DemoModelActions)

- (UIViewController *)SQAppRouter_viewControllerForDemoModel;
- (void)SQAppRouter_presentImage:(UIImage *)image;
- (void)SQAppRouter_showAlertWithMessage:(NSString *)message cancelAction:(void (^)(NSDictionary *info))infoAction confirmAction:(void (^)(NSDictionary* info))confirmActiom;
@end
