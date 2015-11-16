//
//  JokesNetManager.h
//  EaseFun
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "BaseNetManager.h"
#import "JokesModel.h"

typedef NS_ENUM(NSUInteger, JokesType) {
    JokesTypeSuggest,
    JokesTypeVideo,
    JokesTypeText,
    JokesTypeImgRank,
    JokesTypeDay,
    JokesTypeLatest
};

@interface JokesNetManager : BaseNetManager

+(id)getJokesModelWithType:(JokesType)type pageId:(NSInteger)pageId completionHandler:(void(^)(id model,NSError *error))completionHandler;

@end
