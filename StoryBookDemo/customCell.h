//
//  customCell.h
//  StoryBookDemo
//
//  Created by 周武德 on 15/9/11.
//  Copyright (c) 2015年 周武德. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^hangleGesBolck)(BOOL isDelete,NSIndexPath *indexPath);
@interface customCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *containrView;
@property (weak, nonatomic) IBOutlet UIView *contentview;
@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,copy)hangleGesBolck cellBlock;

@end
