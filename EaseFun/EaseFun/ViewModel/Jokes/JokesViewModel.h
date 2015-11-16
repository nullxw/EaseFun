//
//  JokesViewModel.h
//  EaseFun
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "BaseViewModel.h"
#import "JokesNetManager.h"

@interface JokesViewModel : BaseViewModel

@property (nonatomic,assign) NSInteger rowNumber;
@property (nonatomic,assign) NSInteger pageId;
/**数据总条数*/
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,assign) BOOL hasMore;
@property (nonatomic,assign) JokesType type;

-(instancetype)initWithJokesType:(JokesType)type;

/**用户头像*/
-(UIImage *)randomUserIconURL;
-(NSString *)userNameForRow:(NSInteger)row;
-(NSString *)titleForRow:(NSInteger)row;
/**封面图片*/
-(NSURL *)coverURLForRow:(NSInteger)row;
/**点赞数*/
-(NSString *)voteForRow:(NSInteger)row;
-(NSString *)commentForRow:(NSInteger)row;
/**分享数*/
-(NSString *)shareForRow:(NSInteger)row;
/**图片高度*/
-(NSNumber *)heightOfCoverForRow:(NSInteger)row;

@end
