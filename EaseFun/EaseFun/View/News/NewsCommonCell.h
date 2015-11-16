//
//  NewsCell.h
//  EaseFun
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClipImageView.h"

@interface NewsCommonCell : UITableViewCell

@property (nonatomic,strong) ClipImageView *iconIV;
@property (nonatomic,strong) UILabel *titleLB;
@property (nonatomic,strong) UILabel *descLB;
@property (nonatomic,strong) UILabel *commentLB;

@end
