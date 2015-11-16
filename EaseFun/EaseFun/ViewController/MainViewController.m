//
//  MainViewController.m
//  EaseFun
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "MainViewController.h"
#import "NewsViewController.h"
#import "JokesViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

+(UITabBarController *)sharedInstance{
    static UITabBarController *vc=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc=[MainViewController new];
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.translucent=NO;
    self.viewControllers=@[[NewsViewController new],[JokesViewController new]];
}


@end
