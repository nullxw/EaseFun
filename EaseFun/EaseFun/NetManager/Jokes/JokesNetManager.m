//
//  JokesNetManager.m
//  EaseFun
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "JokesNetManager.h"

#define kJokesPath @"http://m2.qiushibaike.com/article/list/%@?page=%ld&count=30&rqcnt=20&r=ffe66222%ld606"

@implementation JokesNetManager

+(id)getJokesModelWithType:(JokesType)type pageId:(NSInteger)pageId completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path=nil;
    switch (type) {
        case JokesTypeSuggest: {
            path=@"suggest";
            break;
        }
        case JokesTypeVideo: {
            path=@"video";
            break;
        }
        case JokesTypeText: {
            path=@"text";
            break;
        }
        case JokesTypeImgRank: {
            path=@"imgrank";
            break;
        }
        case JokesTypeDay: {
            path=@"day";
            break;
        }
        case JokesTypeLatest: {
            path=@"latest";
            break;
        }
        default: {
            break;
        }
    }
    return [self GET:[NSString stringWithFormat:kJokesPath,path,pageId,kCurrentTimeInterval] parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([JokesModel mj_objectWithKeyValues:responseObj],error);
    }];
}

@end
