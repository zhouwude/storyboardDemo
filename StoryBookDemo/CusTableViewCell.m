//
//  CusTableViewCell.m
//  StoryBookDemo
//
//  Created by 周武德 on 14/12/19.
//  Copyright (c) 2014年 周武德. All rights reserved.
//

#import "CusTableViewCell.h"
#import "modelData.h"
@implementation CusTableViewCell

- (void)awakeFromNib {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 20, 59)];
    label.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:label];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)confifUI:(modelData *)model{
    //所有的控件都加载在contentView上；如果不是  则在使用编辑风格时  则回出现遮挡。Autosizing这个属性解决。
    self.label1.text = model.name;
    self.label2.text = model.game;
    
    
}
@end
