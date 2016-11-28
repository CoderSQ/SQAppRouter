//
//  Target_DemoModel.h
//  SQAppMediator
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Target_DemoModul : NSObject

- (UIViewController *)Action_nativeFetchDemoModulViewController:(NSDictionary *)params;
- (id)Action_nativePresentImage:(NSDictionary *)params;
- (id)Action_nativeNoImage:(NSDictionary *)params;

- (id)Action_nativeShowAlert:(NSDictionary *)params;
@end
