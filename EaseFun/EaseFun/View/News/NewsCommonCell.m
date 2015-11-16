//
//  NewsCell.m
//  EaseFun
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "NewsCommonCell.h"

@implementation NewsCommonCell

- (ClipImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[ClipImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kleftRightPadding);
            make.top.mas_equalTo(kTopPadding);
            make.size.mas_equalTo(CGSizeMake(kiconWidth, kiconWidth));
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(2);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-kleftRightPadding);
        }];
        _titleLB.font=[UIFont systemFontOfSize:kTitleSize];
    }
    return _titleLB;
}

- (UILabel *)descLB {
    if(_descLB == nil) {
        _descLB = [[UILabel alloc] init];
        [self.contentView addSubview:_descLB];
        [_descLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLB.mas_leftMargin);
            make.top.mas_equalTo(self.titleLB.mas_bottom).mas_equalTo(5);
            make.rightMargin.mas_equalTo(self.titleLB.mas_rightMargin);
        }];
        _descLB.textColor=[UIColor lightGrayColor];
        _descLB.font=[UIFont systemFontOfSize:kDescSize];
        _descLB.numberOfLines=0;
    }
    return _descLB;
}

- (UILabel *)commentLB {
    if(_commentLB == nil) {
        _commentLB = [[UILabel alloc] init];
        [self.contentView addSubview:_commentLB];
        [_commentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.rightMargin.mas_equalTo(self.titleLB.mas_rightMargin);
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(2);
            make.bottom.mas_equalTo(-kBottomPadding);
            make.width.mas_lessThanOrEqualTo(kCommentWidth);
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
