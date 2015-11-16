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
            make.left.top.mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(kiconWidth, kiconWidth));
            make.bottom.mas_equalTo(-5);
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
            make.right.mas_lessThanOrEqualTo(-5);
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
            make.bottom.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(-2);
        }];
        _descLB.textColor=[UIColor lightGrayColor];
        _descLB.font=[UIFont systemFontOfSize:kDescSize];
    }
    return _descLB;
}

- (UILabel *)commentLB {
    if(_commentLB == nil) {
        _commentLB = [[UILabel alloc] init];
        [self.contentView addSubview:_commentLB];
        [_commentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.rightMargin.mas_equalTo(self.titleLB.mas_rightMargin);
            make.bottomMargin.mas_equalTo(self.descLB.mas_bottomMargin);
            make.width.mas_lessThanOrEqualTo(40);
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
