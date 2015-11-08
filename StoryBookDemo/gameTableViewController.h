//
//  gameTableViewController.h
//  StoryBookDemo
//
//  Created by 周武德 on 14/12/23.
//  Copyright (c) 2014年 周武德. All rights reserved.
//

#import <UIKit/UIKit.h>
@class gameTableViewController;
@protocol GamePickerViewControllerDelegate <NSObject>
- (void)gamePickerViewController:
(gameTableViewController *)controller
                   didSelectGame:(NSString *)thegame;
@end
@interface gameTableViewController : UITableViewController
@property(nonatomic,assign)id<GamePickerViewControllerDelegate>delegate;
@property (nonatomic, strong) NSString *game;
@end
