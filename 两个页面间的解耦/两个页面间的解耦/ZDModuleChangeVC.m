//
//  ZDModuleChangeVC.m
//  两个页面间的解耦
//
//  Created by zhudong on 2017/2/23.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import "ZDModuleChangeVC.h"
#import "UIViewController+TopViewController.h"
#import "ZDBaseViewController.h"

@interface ZDModuleChangeVC ()
{
    NSMutableDictionary *viewControllers;
}

@end

@implementation ZDModuleChangeVC
+ (instancetype)shareInstance{
    static ZDModuleChangeVC *moduleC;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        moduleC = [[self alloc] init];
    });
    return moduleC;
}

- (void)registerViewControllers: (NSString *)plistPath{
    if (!viewControllers) {
        viewControllers = [[NSMutableDictionary alloc] init];
    }
    [viewControllers addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:plistPath]];
}

- (void)presentViewController:(NSString *)vCKey withDict:(NSDictionary *)dict animated: (BOOL)flag completion:(void (^)(void))completion{
    if (!viewControllers[vCKey]) {
        NSLog(@"控制器不存在");
        return;
    }
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//#pragma clang diagnostic pop
    Class vC = NSClassFromString((NSString *)viewControllers[vCKey]);
    ZDBaseViewController *baseVC = [[vC alloc] initWithDict:dict];
    [[UIViewController topViewController] presentViewController:baseVC animated:flag completion:completion];
}

- (void)pushViewController:(NSString *)vCKey withDict:(NSDictionary *)dict animated:(BOOL)animated{
    if (!viewControllers[vCKey]) {
        NSLog(@"控制器不存在");
        return;
    }
    Class vC = NSClassFromString((NSString *)viewControllers[vCKey]);
    ZDBaseViewController *baseVC = [[vC alloc] initWithDict:dict];
    UINavigationController *nav = [UIViewController topViewController].navigationController;
    if (!nav) {
        NSLog(@"nav控制器不存在");
        return;
    }
    [nav pushViewController:baseVC animated:animated];
}
@end
