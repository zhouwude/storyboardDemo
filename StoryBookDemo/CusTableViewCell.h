//
//  CusTableViewCell.h
//  StoryBookDemo
//
//  Created by 周武德 on 14/12/19.
//  Copyright (c) 2014年 周武德. All rights reserved.
//

#import <UIKit/UIKit.h>
@class modelData;
@interface CusTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
-(void)confifUI:(modelData *)model;



@end
