//
//  Factory.m
//
//  Created by IncredibleMJ on 15/11/13.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "Factory.h"

@implementation Factory

+(void)addMenuItemToVC:(UIViewController *)vc{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_red"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_n"] forState:UIControlStateHighlighted];
    btn.frame=CGRectMake(0, 0, 30, 30);
    [btn bk_addEventHandler:^(id sender) {
        [vc.sideMenuViewController presentLeftMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *menuItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    
    vc.navigationItem.leftBarButtonItems=@[spaceItem,menuItem];
}

+(void)addBackItemToVC:(UIViewController *)vc{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"btn_back_n"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"btn_back_h"] forState:UIControlStateHighlighted];
    btn.frame=CGRectMake(0, 0, 45, 44);
    [btn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *menuItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -16;
    
    vc.navigationItem.leftBarButtonItems=@[spaceItem,menuItem];
}

@end
