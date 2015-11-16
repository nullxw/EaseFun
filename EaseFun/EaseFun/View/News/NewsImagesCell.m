//
//  NewsImagesCell.m
//  EaseFun
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 IncredibleMJ. All rights reserved.
//

#import "NewsImagesCell.h"

#define kImageSpace 5

@implementation NewsImagesCell

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(5);
            make.right.mas_lessThanOrEqualTo(-5);
        }];
        _titleLB.font=[UIFont systemFontOfSize:kTitleSize];
    }
    return _titleLB;
}

- (ClipImageView *)iconIV1 {
    if(_iconIV1 == nil) {
        _iconIV1 = [[ClipImageView alloc] init];
        [self.contentView addSubview:_iconIV1];
        [_iconIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLB.mas_leftMargin);
            make.top.mas_equalTo(self.titleLB.mas_bottom).mas_equalTo(2);
            make.size.mas_equalTo(CGSizeMake((kWindowW-4*kImageSpace)/3, kiconWidth));
        }];
    }
    return _iconIV1;
}

- (ClipImageView *)iconIV2 {
    if(_iconIV2 == nil) {
        _iconIV2 = [[ClipImageView alloc] init];
        [self.contentView addSubview:_iconIV2];
        [_iconIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconIV1.mas_topMargin);
            make.size.mas_equalTo(self.iconIV1);
            make.left.mas_equalTo(self.iconIV1.mas_right).mas_equalTo(kImageSpace);
        }];
    }
    return _iconIV2;
}

- (ClipImageView *)iconIV3 {
    if(_iconIV3 == nil) {
        _iconIV3 = [[ClipImageView alloc] init];
        [self.contentView addSubview:_iconIV3];
        [_iconIV3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconIV1.mas_topMargin);
            make.left.mas_equalTo(self.iconIV2.mas_right).mas_equalTo(kImageSpace);
            make.size.mas_equalTo(self.iconIV1);
        }];
    }
    return _iconIV3;
}

- (UILabel *)commentLB {
    if(_commentLB == nil) {
        _commentLB = [[UILabel alloc] init];
        [self.contentView addSubview:_commentLB];
        [_commentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.rightMargin.mas_equalTo(self.iconIV3.mas_rightMargin);
            make.top.mas_equalTo(self.iconIV1.mas_bottom).mas_equalTo(5);
            make.bottom.mas_equalTo(-2);
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
