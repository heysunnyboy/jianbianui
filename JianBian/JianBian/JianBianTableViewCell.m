//
//  JianBianTableViewCell.m
//  JianBian
//
//  Created by sunny on 15/12/16.
//  Copyright © 2015年 maja. All rights reserved.
//

#import "JianBianTableViewCell.h"

@implementation JianBianTableViewCell

- (void)awakeFromNib {
    [_view setImage:[UIImage imageNamed:@"1.jpg"]];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setJianBianWithBeforeColor:(UIColor *)beforeColor afterColr:(UIColor *)afterColor
{
    CAGradientLayer *newShadow = [[CAGradientLayer alloc] init];
    
    CGRect newShadowFrame = CGRectMake(0, 0, 40, 40);
    newShadow.frame = newShadowFrame;
    newShadow.opacity = 0.7;
    newShadow.cornerRadius =20;
    _view.layer.cornerRadius = 20;
    //添加渐变的颜色组合
    newShadow.colors = [NSArray arrayWithObjects:(id)beforeColor.CGColor,(id)afterColor.CGColor,nil];
    [_view.layer addSublayer:newShadow];
    CAGradientLayer *newShadow1 = [[CAGradientLayer alloc] init];
    
    CGRect newShadowFrame1= CGRectMake(0, 0, 10, 68);
    newShadow1.frame = newShadowFrame1;
    newShadow1.opacity = 0.7;
    //添加渐变的颜色组合
    newShadow1.colors = [NSArray arrayWithObjects:(id)beforeColor.CGColor,(id)afterColor.CGColor,nil];
    [_line.layer addSublayer:newShadow1];
}

@end
