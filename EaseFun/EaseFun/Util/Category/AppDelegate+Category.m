//
//  AppDelegate+Category.m
//
//  Created by IncredibleMJ on 15/11/13.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "AppDelegate+Category.h"
#import <AFNetworkActivityIndicatorManager.h>
//#import "MobClick.h"
#import <MLTransition.h>

@implementation AppDelegate (Category)

- (void)initializeWithApplication:(UIApplication *)application{
    //  注册DDLog 取代 NSLog
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    //    电池条显示网络活动
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    //    检测网络状态
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        DDLogVerbose(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                self.onLine = YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                self.onLine = NO;
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
//    [MobClick startWithAppkey:@"5632e64be0f55a4b6c002dac"];
//    [MobClick setLogEnabled:YES];
    
    /**解决替换系统leftBarButtonItems后左滑返回生效的问题*/
    [MLTransition validatePanPackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypeScreenEdgePan];
}



@end
