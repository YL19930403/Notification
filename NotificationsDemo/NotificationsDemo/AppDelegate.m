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
    
    //如果非正常启动的App，launchOptions里面就会存放着额外的参数
    NSLog(@"%@",launchOptions) ;
    
    UITextView * tv = [[UITextView alloc] initWithFrame:CGRectMake(10, 200, 300, 100)];
    tv.text = launchOptions.description ;
    tv.backgroundColor = [UIColor orangeColor];
    [self.window.rootViewController.view addSubview:tv];
    
    if (launchOptions[@"UIApplicationLaunchOptionsLocalNotificationKey"]) {
          //// 如果这里面有值, 意味着, 是通过点击通知打开的app
        UILocalNotification * localNoti = launchOptions[@"UIApplicationLaunchOptionsLocalNotificationKey"];
    }
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"still water run deep") ;
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

/**
 *  当用户接收到了通知，并且：
     1. 当App在前台时，能够接收
     2. 当App在后台时，点击通知，能够接收
     3. 当App锁屏时，滑动通知，打开app，能够接收
     4. 当App被彻底关闭时，则会到 didFinishLaunchingWithOptions 方法里面接收通知
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    // QQ场景: 当QQ在前台时, 接收到通知, 只是提醒数字, 但是不会跳转界面. 如果QQ在后台, 这时候收到通知, 跳转新界面
    /**
     *      UIApplicationStateActive, // 当前活动状态, 前台
            UIApplicationStateInactive, // 进入前台
            UIApplicationStateBackground // 后台
     */
    NSLog(@"%zd",application.applicationState) ;
    if (application.applicationState == UIApplicationStateActive) {
        NSLog(@"通过数字来提醒用户");
    }else if (application.applicationState == UIApplicationStateInactive){
        NSLog(@"跳转界面");
    }
        

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




















