//
//  bookViewController.h
//  StoryBookDemo
//
//  Created by 周武德 on 14/12/24.
//  Copyright (c) 2014年 周武德. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bookViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *mytableView;

@end
