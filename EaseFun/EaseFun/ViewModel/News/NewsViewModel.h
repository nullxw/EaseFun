//
//  NewsViewModel.h
//  EaseFun
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "BaseViewModel.h"
#import "NewsNetManager.h"

@interface NewsViewModel : BaseViewModel

@property (nonatomic,assign) NSInteger rowNumber;
/**焦点图片*/
@property (nonatomic,strong) NSArray *focusImages;
@property (nonatomic,assign) NSInteger pageId;

-(NSString *)titleForRow:(NSInteger)row;
/**Cell左侧图片*/
-(NSURL *)iconURLForRow:(NSInteger)row;
/**副标题*/
-(NSString *)introForRow:(NSInteger)row;
-(NSString *)commentCountForRow:(NSInteger)row;
-(BOOL)containsImagesForRow:(NSInteger)row;
-(BOOL)containsVideoForRow:(NSInteger)row;
/**Cell中三张图片*/
-(NSArray *)imageURLsForRow:(NSInteger)row;
/**跳转链接*/
-(NSURL *)linkForRow:(NSInteger)row;

@end