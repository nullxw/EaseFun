//
//  AppDelegate.h
//  EaseFun
//
//  Created by IncredibleMJ on 15/11/13.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RESideMenu.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) RESideMenu *sideMenu;
@property(nonatomic,getter=isOnLine) BOOL onLine; //网络状态

@end

