//
//  AppDelegate.m
//  NotificationsDemo
//
//  Created by 余亮 on 16/2/22.
//  Copyright © 2016年 余亮. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //判断系统版本号
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        [self registerAuthor];
    }
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"still water run deep") ;
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

#pragma mark  - 私有方法
- (void) registerAuthor
{
   //创建通知设置对象
    UIUserNotificationSettings * setting = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert) categories:nil];
  //注册通知设置
    [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    
}

@end




















