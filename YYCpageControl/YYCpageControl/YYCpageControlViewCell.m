//
//  YYCpageControlViewCell.m
//  YYCpageControl
//
//  Created by Just_ on 2017/2/27.
//  Copyright © 2017年 Just_. All rights reserved.
//

#import "YYCpageControlViewCell.h"

@implementation YYCpageControlViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.button];
    }
    return self;
}



-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = self.contentView.bounds;
    
    [self.button sizeToFit];

    self.button.frame = CGRectMake((self.bounds.size.width - self.button.bounds.size.width+20.f)/2, self.bounds.size.height - 120.f - (self.button.bounds.size.height+20.f), self.button.bounds.size.width+20.f, self.button.bounds.size.height+20.f);
}

-(UIButton *)button{
    
    if(!_button){
        UIButton *button = [[UIButton alloc]init];
        button.backgroundColor = [UIColor blueColor];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 10.f;
        _button = button;
    }
    return _button;
}

-(UIImageView *)imageView{
    
    if(!_imageView){
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.contentMode = UIViewContentModeScaleToFill;
        _imageView = imageView;
    }
    return _imageView;
}

@end
