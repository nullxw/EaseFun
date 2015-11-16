//
//  NewsViewModel.m
//  EaseFun
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "NewsViewModel.h"

@implementation NewsViewModel

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId = 1;
    [self getDataFromNetCompleteHandle:^(NSError *error) {
        completionHandle(error);
    }];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _pageId +=1;
    [self getDataFromNetCompleteHandle:^(NSError *error) {
        completionHandle(error);
    }];
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    if(_pageId == 1){
        [self.dataArr removeAllObjects];
        self.focusImages=nil;
    }
    self.dataTask=[NewsNetManager getNewsModelWithPageId:_pageId completionHandler:^(NewsModel *model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.data.list];
        //获取焦点图片
        NSMutableArray *URLs=[NSMutableArray new];
        for(NewsDataListModel *obj in model.data.list){
            if([obj isFocus]){
                NSArray *list=obj.pics.list;
                for(ListPicsListModel *subObj in list){
                    [URLs addObject:[NSURL URLWithString:subObj.kpic]];
                }
                self.focusImages=[URLs copy];
            }
        }
        completionHandle(error);
    }];
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(NewsDataListModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
/**Cell左侧图片 / 视频封面 */
-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].kpic];
}
/**副标题*/
-(NSString *)introForRow:(NSInteger)row{
    return [self modelForRow:row].intro;
}
-(NSString *)commentCountForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%ld评论",[self modelForRow:row].commentCountInfo.total];
}
-(BOOL)containsImagesForRow:(NSInteger)row{
    return [[self modelForRow:row].category isEqualToString:@"hdpic"];
}
-(BOOL)containsVideoForRow:(NSInteger)row{
    return [[self modelForRow:row].category isEqualToString:@"video"];
}
/**Cell中三张图片*/
-(NSArray *)imageURLsForRow:(NSInteger)row{
    NSMutableArray *URLs=[NSMutableArray new];
    for(ListPicsListModel *obj in [self modelForRow:row].pics.list){
        [URLs addObject:[NSURL URLWithString:obj.kpic]];
    }
    return [URLs copy];
}
/**跳转链接*/
-(NSURL *)linkForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].link];
}

@end
