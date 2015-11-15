//
//  NewsModel.m
//  EaseFun
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

@end
@implementation NewsDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [NewsDataListModel class]};
}

@end


@implementation NewsDataListModel

+(NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    if([propertyName isEqualToString:@"ID"]){
        return @"id";
    }
    return [propertyName mj_underlineFromCamel];
}

@end


@implementation ListPicsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [ListPicsListModel class]};
}

@end


@implementation ListPicsListModel

@end


@implementation ListCommentCountInfoModel

@end


