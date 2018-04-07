//
//  AnimationTVCell.m
//  DemoAnimation
//
//  Created by Shenll-Mac-04 on 05/04/18.
//  Copyright © 2018 Shenll-Mac-04. All rights reserved.
//

#import "AnimationTVCell.h"


@implementation AnimationTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _AnimationImage.layer.masksToBounds = YES;
    _AnimationImage.layer.cornerRadius = 10;
    _AnimationImage.layer.borderWidth = 2.0;
    _AnimationImage.layer.borderColor =  [UIColor colorWithRed:99/255.0 green:98/255.0 blue:98/255.0 alpha:0.05].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
