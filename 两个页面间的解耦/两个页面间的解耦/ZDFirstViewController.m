//
//  ZDFirstViewController.m
//  两个页面间的解耦
//
//  Created by zhudong on 2017/2/23.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ZDFirstViewController.h"

@interface ZDFirstViewController ()

@end

@implementation ZDFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(100, 150, 100, 50);
    [self.view addSubview:backBtn];
}



- (void)backBtnClick {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:true];
    }else{
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

@end
