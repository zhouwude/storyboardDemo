//
//  ZWDTableViewController.h
//  StoryBookDemo
//
//  Created by 周武德 on 14/12/18.
//  Copyright (c) 2014年 周武德. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableDetailViewController.h"
@interface ZWDTableViewController : UITableViewController<PlayerDetailsViewControllerDelegate>
@property(nonatomic,strong)NSMutableArray *dataArray;
@end
