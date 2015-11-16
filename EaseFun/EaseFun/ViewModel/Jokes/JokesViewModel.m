//
//  JokesViewModel.m
//  EaseFun
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "JokesViewModel.h"

@implementation JokesViewModel

-(instancetype)initWithJokesType:(JokesType)type{
    if(self=[super init]){
        _type=type;
    }
    return self;
}

-(instancetype)init{
    if(self=[super init]){
        NSAssert1(NO, @"%s 请使用 initWithJokesType: 初始化", __FUNCTION__);
    }
    return self;
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId = 1;
    [self getDataFromNetCompleteHandle:^(NSError *error) {
        completionHandle(error);
    }];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    if(![self hasMore]){
        NSError *error=[NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据"}];
        completionHandle(error);
    }else{
        _pageId += 1;
        [self getDataFromNetCompleteHandle:^(NSError *error) {
            completionHandle(error);
        }];
    }
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    if(_pageId == 1){
        [self.dataArr removeAllObjects];
    }
    self.dataTask=[JokesNetManager getJokesModelWithType:_type pageId:_pageId completionHandler:^(JokesModel *model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.items];
        completionHandle(error);
    }];
}

-(JokesItemsModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

/**用户头像*/
-(UIImage *)randomUserIconURL{
    return [UIImage imageNamed:[NSString stringWithFormat:@"icon%u",arc4random()%44]];
}
-(NSString *)userNameForRow:(NSInteger)row{
    return [self modelForRow:row].user.login;
}
-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].content;
}
/**封面图片*/
-(NSURL *)coverURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].highUrl];
}
-(NSString *)voteForRow:(NSInteger)row{
    return @([self modelForRow:row].votes.up).stringValue;
}
-(NSString *)commentForRow:(NSInteger)row{
    return @([self modelForRow:row].commentsCount).stringValue;
}
-(NSString *)shareForRow:(NSInteger)row{
    return @([self modelForRow:row].shareCount).stringValue;
}
-(NSNumber *)heightOfCoverForRow:(NSInteger)row{
    return [self modelForRow:row].picSize[1];
}

-(BOOL)hasMore{
    return _pageId * 30 <= _total;
}

@end
