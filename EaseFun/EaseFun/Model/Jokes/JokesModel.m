//
//  JokesModel.m
//  EaseFun
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "JokesModel.h"

@implementation JokesModel

+ (NSDictionary *)objectClassInArray{
    return @{@"items" : [JokesItemsModel class]};
}

@end

@implementation JokesItemsModel

+(NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    if([propertyName isEqualToString:@"ID"]){
        return @"id";
    }
    return [propertyName mj_underlineFromCamel];
}

@end


@implementation JokesItemsVotesModel

@end


@implementation JokesItemsUserModel

+(NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    if([propertyName isEqualToString:@"ID"]){
        return @"id";
    }
    return [propertyName mj_underlineFromCamel];
}

@end


@implementation JokesItemsImageSizeModel

@end


