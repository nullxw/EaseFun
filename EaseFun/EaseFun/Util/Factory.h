//
//  Factory.h
//
//  Created by IncredibleMJ on 15/11/13.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
/**
 向某个控制器添加菜单按钮
 */
+(void)addMenuItemToVC:(UIViewController *)vc;

/** 向某个控制器添加返回按钮*/
+(void)addBackItemToVC:(UIViewController *)vc;

@end
