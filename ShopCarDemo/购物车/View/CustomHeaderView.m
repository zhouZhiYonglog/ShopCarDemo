//
//  CustomHeaderView.m
//  ShopCarDemo
//
//  Created by 周智勇 on 16/7/25.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import "CustomHeaderView.h"
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define RGBColor(r, g, b) RGBAColor(r,g,b,1.0)
@interface CustomHeaderView ()
@property (nonatomic, strong)UIView * topView;
@property (nonatomic, strong)UIButton * leftBtn;
@property (nonatomic, strong)UILabel * titleLable;
@end

@implementation CustomHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBColor(255, 255, 255);
        [self addSubview:self.topView];
        [self addSubview:self.leftBtn];
        [self addSubview:self.titleLable];
    }
    return self;
}

#pragma mark -- Lazy Loading

-(UIView *)topView{
    if (_topView == nil) {
        self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 10)];
        _topView.backgroundColor = RGBAColor(240, 240, 240, 1);
    }
    return _topView;
}

-(UIButton *)leftBtn{
    if (_leftBtn == nil) {
        self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame = CGRectMake(5, 21, 18, 18);
        [_leftBtn setImage:[UIImage imageNamed:@"shoppingCar_unselect"] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

-(UILabel *)titleLable{
    if (_titleLable == nil) {
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(35, 20, 120, 20)];
        _titleLable.text = @"店铺名称";
        _titleLable.font = [UIFont systemFontOfSize:16];
    }
    return _titleLable;
}

#pragma mark --- Clicked event
- (void)clicked{
    NSLog(@"店铺按钮被点击");
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickedWhichHeaderView:)]) {
        [self.delegate clickedWhichHeaderView:self.tag];
    }
}


-(void)setModel:(ShopCarModel *)model{
    _model = model;
    self.titleLable.text = _model.dianpuTitle;
    if (_model.isChecked) {
        [self.leftBtn setImage:[UIImage imageNamed:@"shoppingCar_select"] forState:UIControlStateNormal];
    }else{
        [self.leftBtn setImage:[UIImage imageNamed:@"shoppingCar_unselect"] forState:UIControlStateNormal];
    }
}

@end
