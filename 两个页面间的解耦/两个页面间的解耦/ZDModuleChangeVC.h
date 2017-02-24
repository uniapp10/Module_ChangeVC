//
//  ZDModuleChangeVC.h
//  两个页面间的解耦
//
//  Created by zhudong on 2017/2/23.
//  Copyright © 2017年 zhudong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDModuleChangeVC : NSObject
+ (instancetype)shareInstance;
- (void)registerViewControllers: (NSString *)plistPath;
- (void)presentViewController:(NSString *)vCKey withDict:(NSDictionary *)dict animated: (BOOL)flag completion:(void (^)(void))completion;
- (void)pushViewController:(NSString *)vCKey withDict:(NSDictionary *)dict animated:(BOOL)animated;
@end
