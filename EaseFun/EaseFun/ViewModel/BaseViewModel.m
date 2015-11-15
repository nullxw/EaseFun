//
//  BaseViewModel.m
//
//  Created by IncredibleMJ on 15/11/13.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

- (void)cancelTask{
    [self.dataTask cancel];
}

- (void)suspendTask{
    [self.dataTask suspend];
}

- (void)resumeTask{
    [self.dataTask resume];
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

@end
