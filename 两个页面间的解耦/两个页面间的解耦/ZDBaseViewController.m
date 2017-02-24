//
//  ZDBaseViewController.m
//  两个页面间的解耦
//
//  Created by zhudong on 2017/2/23.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ZDBaseViewController.h"

@interface ZDBaseViewController ()
@property (nonatomic, strong) NSDictionary<NSString *, id> *params;
@end

@implementation ZDBaseViewController

- (instancetype)initWithDict: (NSDictionary *)params{
    self = [super init];
    if (self) {
        _params = params;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
