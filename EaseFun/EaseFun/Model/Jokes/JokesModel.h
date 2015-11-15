//
//  JokesModel.h
//  EaseFun
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "BaseModel.h"

@class JokesItemsModel,JokesItemsVotesModel,JokesItemsUserModel,JokesItemsImageSizeModel;

@interface JokesModel : BaseModel

@property (nonatomic, assign) NSInteger err;

@property (nonatomic, assign) NSInteger refresh;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<JokesItemsModel *> *items;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger page;

@end
@interface JokesItemsModel : NSObject

@property (nonatomic, assign) NSInteger publishedAt;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *state;

@property (nonatomic, copy) NSString *lowUrl;

@property (nonatomic, strong) NSArray<NSNumber *> *picSize;

@property (nonatomic, assign) NSInteger createdAt;

@property (nonatomic, assign) NSInteger shareCount;

@property (nonatomic, assign) NSInteger loop;

@property (nonatomic, copy) NSString *picUrl;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, strong) JokesItemsImageSizeModel *imageSize;

@property (nonatomic, copy) NSString *format;

@property (nonatomic, assign) BOOL allowComment;

@property (nonatomic, assign) NSInteger commentsCount;

@property (nonatomic, strong) JokesItemsUserModel *user;

@property (nonatomic, copy) NSString *highUrl;

@property (nonatomic, strong) JokesItemsVotesModel *votes;

@end

@interface JokesItemsVotesModel : NSObject

@property (nonatomic, assign) NSInteger up;

@property (nonatomic, assign) NSInteger down;

@end

@interface JokesItemsUserModel : NSObject

@property (nonatomic, copy) NSString *login;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger avatarUpdatedAt;

@property (nonatomic, assign) NSInteger createdAt;

@property (nonatomic, copy) NSString *role;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, copy) NSString *lastDevice;

@property (nonatomic, copy) NSString *state;

@property (nonatomic, assign) NSInteger lastVisitedAt;

@end

@interface JokesItemsImageSizeModel : NSObject

@property (nonatomic, strong) NSArray<NSNumber *> *s;

@property (nonatomic, strong) NSArray<NSNumber *> *m;

@end

