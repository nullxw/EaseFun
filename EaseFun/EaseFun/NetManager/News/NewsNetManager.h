//
//  NewsNetManager.h
//  EaseFun
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "BaseNetManager.h"
#import "NewsModel.h"

@interface NewsNetManager : BaseNetManager

+(id)getNewsModelWithPageId:(NSInteger)pageId completionHandler:(void(^)(id model,NSError *error))completionHandler;

@end
