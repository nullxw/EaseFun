//
//  NewsModel.h
//  EaseFun
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "BaseModel.h"

@class NewsDataModel,NewsDataListModel,ListPicsModel,ListPicsListModel,ListCommentCountInfoModel,NewsDataListVideoModel;

@class VideoInfoModel;
@interface NewsModel : BaseModel

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NewsDataModel *data;

@end
@interface NewsDataModel : NSObject

@property (nonatomic, copy) NSString *isIntro;

@property (nonatomic, strong) NSArray<NewsDataListModel *> *list;

@end

@interface NewsDataListModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *kpic;

@property (nonatomic, copy) NSString *comments;

@property (nonatomic, copy) NSString *feedShowStyle;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, copy) NSString *bpic;

@property (nonatomic, assign) NSInteger pubDate;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, assign) NSInteger comment;

@property (nonatomic, strong) ListCommentCountInfoModel *commentCountInfo;

@property (nonatomic, copy) NSString *longTitle;

@property (nonatomic, assign) BOOL isFocus;

@property (nonatomic, strong) ListPicsModel *pics;

@property (nonatomic,strong) NewsDataListVideoModel *videoInfo;

@end

@interface NewsDataListVideoModel : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *runtime;

@property (nonatomic, copy) NSString *kpic;

@property (nonatomic, assign) NSInteger playnumber;

@property (nonatomic, copy) NSString *video_id;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, assign) BOOL widtwidth;

@property (nonatomic, copy) NSString *url;

@end

@interface ListPicsModel : NSObject

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, strong) NSArray<ListPicsListModel *> *list;

@end

@interface ListPicsListModel : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *alt;

@property (nonatomic, copy) NSString *kpic;

@end

@interface ListCommentCountInfoModel : NSObject

@property (nonatomic, assign) NSInteger commentStatus;

@property (nonatomic, assign) NSInteger qreply;

@property (nonatomic, assign) NSInteger show;

@property (nonatomic, assign) NSInteger dispraise;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger praise;

@end

