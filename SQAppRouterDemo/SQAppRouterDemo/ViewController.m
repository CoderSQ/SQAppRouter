//
//  ViewController.m
//  SQAppRouter
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "ViewController.h"
#import "SQAppRouter+DemoModelActions.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *arrayDatas;


@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayDatas.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = self.arrayDatas[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UIViewController *vc = [[SQAppRouter sharedRouter] SQAppRouter_viewControllerForDemoModel];
        [self presentViewController:vc animated:YES completion:nil];
        
    } else if (indexPath.row == 1) {
        UIViewController *vc = [[SQAppRouter sharedRouter] SQAppRouter_viewControllerForDemoModel];
        [self.navigationController pushViewController:vc animated:YES];
    }  else if (indexPath.row == 2) {
        [[SQAppRouter sharedRouter] SQAppRouter_presentImage:[UIImage imageNamed:@"images_goods"]];
    } else if (indexPath.row == 3) {
        [[SQAppRouter sharedRouter] SQAppRouter_presentImage:nil];
    } else if (indexPath.row == 4) {
        [[SQAppRouter sharedRouter] SQAppRouter_showAlertWithMessage:@"这是一个alert" cancelAction:^(NSDictionary *info) {
            NSLog(@"info = %@", info);
        } confirmAction:^(NSDictionary *info) {
            NSLog(@"info = %@", info);
        }];
    }
}

#pragma mark - getter
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

- (NSArray *)arrayDatas {
    if (_arrayDatas == nil) {
        _arrayDatas = @[@"present detail view controller", @"push detail view controller", @"present image", @"present image when error", @"show alert"];
    }
    
    return _arrayDatas;
}

@end
