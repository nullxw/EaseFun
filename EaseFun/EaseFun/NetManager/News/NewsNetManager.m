//
//  NewsNetManager.m
//  EaseFun
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "NewsNetManager.h"

#define kNewsPath @"http://api.sina.cn/sinago/list.json?&platfrom_version=4.2.1&s=20&p=%ld&channel=news_toutiao"

@implementation NewsNetManager

+(id)getNewsModelWithPageId:(NSInteger)pageId completionHandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:[NSString stringWithFormat:kNewsPath,pageId] parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([NewsModel mj_objectWithKeyValues:responseObj],error);
    }];
}

@end
