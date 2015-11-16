//
//  NewsImagesCell.h
//  EaseFun
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClipImageView.h"

@interface NewsImagesCell : UITableViewCell

@property (nonatomic,strong) UILabel *titleLB;
@property (nonatomic,strong) ClipImageView *iconIV1;
@property (nonatomic,strong) ClipImageView *iconIV2;
@property (nonatomic,strong) ClipImageView *iconIV3;
@property (nonatomic,strong) UILabel *commentLB;

@end
