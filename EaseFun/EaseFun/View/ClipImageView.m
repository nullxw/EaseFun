//
//  ClipImageView.m
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ClipImageView.h"

@implementation ClipImageView

-(id)init{
    if(self=[super init]){
        _imageView=[UIImageView new];
        [self addSubview:_imageView];
        _imageView.contentMode=UIViewContentModeScaleAspectFill;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        self.clipsToBounds=YES;
    }
    return self;
}

@end
