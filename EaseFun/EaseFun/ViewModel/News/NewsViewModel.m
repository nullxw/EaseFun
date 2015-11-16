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
        if(_pageId == 1){
            //获取焦点图片
            NSMutableArray *URLs=[NSMutableArray new];
            for(NewsDataListModel *obj in model.data.list){
                if([obj isFocus]){
                    [URLs addObject:[NSURL URLWithString:obj.kpic]];
                }
            }
            self.focusImages=[URLs copy];
        }
        [self.dataArr addObjectsFromArray:model.data.list];
        completionHandle(error);
    }];
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(NSInteger)focusImageCount{
    return self.focusImages.count;
}

-(NewsDataListModel *)newsModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self newsModelForRow:row].title;
}
/**Cell左侧图片 / 视频封面 */
-(NSURL *)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self newsModelForRow:row].kpic];
}
/**副标题*/
-(NSString *)introForRow:(NSInteger)row{
    return [self newsModelForRow:row].intro;
}
-(NSString *)commentCountForRow:(NSInteger)row{
    double count =[self newsModelForRow:row].commentCountInfo.total;
    if(count >= 10000){
        count = count/10000.0;
        return [NSString stringWithFormat:@"%.1f万评论",count];
    }
    return [NSString stringWithFormat:@"%ld评论",(NSInteger)count];
}
-(BOOL)containsBigCoverForRow:(NSInteger)row{
    NewsDataListModel *model=[self newsModelForRow:row];
    return model.bpic.length != 0;
}

-(BOOL)containsVideoForRow:(NSInteger)row{
    return [[self newsModelForRow:row].category isEqualToString:@"video"];
}
-(BOOL)containsImagesForRow:(NSInteger)row{
    return [[self newsModelForRow:row].category isEqualToString:@"hdpic"];
}
/**Cell中三张图片*/
-(NSArray *)imageURLsForRow:(NSInteger)row{
    NSMutableArray *URLs=[NSMutableArray new];
    for(ListPicsListModel *obj in [self newsModelForRow:row].pics.list){
        [URLs addObject:[NSURL URLWithString:obj.kpic]];
    }
    return [URLs copy];
}
/**跳转链接*/
-(NSURL *)linkForRow:(NSInteger)row{
    if([self containsVideoForRow:row]){
        return [NSURL URLWithString:[self newsModelForRow:row].videoInfo.url];
    }
    return [NSURL URLWithString:[self newsModelForRow:row].link];
}

-(NSURL *)bigCoverURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self newsModelForRow:row].bpic];
}

@end
