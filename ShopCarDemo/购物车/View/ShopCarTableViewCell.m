//
//  ShopCarTableViewCell.m
//  ShopCarDemo
//
//  Created by 周智勇 on 16/7/25.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import "ShopCarTableViewCell.h"
#import "CountView.h"

@interface ShopCarTableViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UILabel *shopTitle;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet CountView *countview;

@end
@implementation ShopCarTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    __weak typeof(self)MySelf = self;
    self.countview.CountBlock = ^(NSInteger num){
        if (MySelf.delegate && [self.delegate respondsToSelector:@selector(changeTheShopCount:count:)]) {
            [MySelf.delegate changeTheShopCount:MySelf count:num];
        }
    };
}

-(void)setModel:(ShopModel *)model{
    _model = model;
    self.shopTitle.text = _model.shopTitle;
    self.priceLable.text = [NSString stringWithFormat:@"￥%.2f", _model.singlePrice];
    self.countview.count =  _model.count;
    if (_model.selected) {
        [self.leftBtn setImage:[UIImage imageNamed:@"shoppingCar_select"] forState:UIControlStateNormal];
    }else{
        [self.leftBtn setImage:[UIImage imageNamed:@"shoppingCar_unselect"] forState:UIControlStateNormal];
    }
}

- (IBAction)leftBtnClicked:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickedWichLeftBtn:)]) {
        [self.delegate clickedWichLeftBtn:self];
    }
}
@end
