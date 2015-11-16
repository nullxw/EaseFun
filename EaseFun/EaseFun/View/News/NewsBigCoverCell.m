//
//  NewsBigCoverCell.m
//  EaseFun
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "NewsBigCoverCell.h"

@implementation NewsBigCoverCell

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(5);
            make.right.mas_lessThanOrEqualTo(-5);
        }];
        _titleLB.font=[UIFont systemFontOfSize:kTitleSize];
        _titleLB.textColor=[UIColor lightGrayColor];
    }
    return _titleLB;
}

- (ClipImageView *)coverIV {
    if(_coverIV == nil) {
        _coverIV = [[ClipImageView alloc] init];
        [self.contentView addSubview:_coverIV];
        [_coverIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLB.mas_leftMargin);
            make.top.mas_equalTo(self.titleLB.mas_bottom).mas_equalTo(2);
            make.height.mas_equalTo(100);
            make.right.mas_equalTo(-5);
        }];
    }
    return _coverIV;
}

- (UILabel *)commentLB {
    if(_commentLB == nil) {
        _commentLB = [[UILabel alloc] init];
        [self.contentView addSubview:_commentLB];
        [_commentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.coverIV.mas_bottom).mas_equalTo(5);
            make.rightMargin.mas_equalTo(self.coverIV.mas_rightMargin);
            make.width.mas_lessThanOrEqualTo(40);
            make.bottom.mas_equalTo(-5);
        }];
        _commentLB.font=[UIFont systemFontOfSize:kCommentSize];
        _commentLB.textColor=[UIColor lightGrayColor];
    }
    return _commentLB;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
    }
    return self;
}

@end
