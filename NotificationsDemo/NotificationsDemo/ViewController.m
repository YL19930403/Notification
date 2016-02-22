//
//  ViewController.m
//  NotificationsDemo
//
//  Created by 余亮 on 16/2/22.
//  Copyright © 2016年 余亮. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 *  发送本地通知：
      授权条件：iOS8之前，直接通过代码就可以发送一个本地通知
               iOS8之后，需要主动请求授权，写在代理里面
 
   通知显示的条件：当App在前台时，不显示通知，
                当App在后台时，显示
                当锁屏时，也会显示
                当App退出时，显示
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)SendLocalNoti:(UIButton *)sender {
    //1. 创建一个本地通知
    UILocalNotification * localNoti = [[UILocalNotification alloc ] init] ;
        //1.1 设定通知的发送时间
    localNoti.fireDate = [NSDate dateWithTimeIntervalSinceNow:3.0];
    
        //1.2 设置通知内容
    localNoti.alertBody = @"别玩啦!!!!!";
    
    /**通知的附加项  */
       //滑动解锁文字设置
    localNoti.hasAction = NO ;
    localNoti.alertAction = @"解锁需谨慎";
    
       //设置通知标题(只在通知中心显示)
    localNoti.alertTitle = @"斗地主";
    
       //设置通知声音
    localNoti.soundName = @"buyao.wav";
    
       //设置图标右上角提醒数字
    localNoti.applicationIconBadgeNumber = 10 ;
    
    
    //2. 发送一个本地通知
        //注意：通知是一个应用程序级别的操作
              //立即发送通知
//    [[UIApplication sharedApplication] presentLocalNotificationNow:localNoti];
    
              //计划发送一个通知
    [[UIApplication sharedApplication] scheduleLocalNotification:localNoti];
    
}


@end















