//
//  ZDMainViewController.m
//  两个页面间的解耦
//
//  Created by zhudong on 2017/2/23.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ZDMainViewController.h"

@interface ZDMainViewController ()

@end

@implementation ZDMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)firstBtnClick {
    [[ZDModuleChangeVC shareInstance] presentViewController:@"LiveCast/01" withDict:nil animated:true completion:nil];
}

- (IBAction)secondBtnClick {
    [[ZDModuleChangeVC shareInstance] pushViewController:@"LiveCast/02" withDict:nil animated:true];
}

@end
