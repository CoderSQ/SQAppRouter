//
//  DemoModelViewController.m
//  SQAppMediator
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "DemoModelViewController.h"

@interface DemoModelViewController ()

@end

@implementation DemoModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.imgView];
}


- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(60, 80, 200, 40);
    }
    
    return _titleLabel;
}


- (UIImageView *)imgView {
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] init];
        _imgView.frame = CGRectMake(60, 140, 200, 200);
    }
    return _imgView;
}

@end
