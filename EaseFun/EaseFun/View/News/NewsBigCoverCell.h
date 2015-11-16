//
//  NewsBigCoverCell.h
//  EaseFun
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClipImageView.h"

@interface NewsBigCoverCell : UITableViewCell

@property (nonatomic,strong) ClipImageView *coverIV;
@property (nonatomic,strong) UILabel *titleLB;
@property (nonatomic,strong) UILabel *commentLB;

@end
