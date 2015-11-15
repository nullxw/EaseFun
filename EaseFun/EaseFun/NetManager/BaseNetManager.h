//
//  BaseNetManager.h
//
//  Created by IncredibleMJ on 15/11/13.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kCompletionHandle completionHandle:(void(^)(id model, NSError *error))completionHandle

@interface BaseNetManager : NSObject

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandler:(void(^)(id responseObj, NSError *error))complete;

/**
 *  将链接中的中文转为百分号形式
 *
 *  @param NSString path:？前面地址  params：？后面参数字典
 *
 *  @return 拼接完整的链接地址
 */
+(NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params;

@end
