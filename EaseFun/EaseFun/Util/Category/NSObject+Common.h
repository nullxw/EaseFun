//
//  NSObject+Common.h
//
//  Created by IncredibleMJ on 15/11/13.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Common)

//显示失败提示
- (void)showErrorMsg:(NSObject *)msg;

//显示成功提示
- (void)showSuccessMsg:(NSObject *)msg;

//显示忙
- (void)showProgress;

//隐藏提示
- (void)hideProgress;

@end
