//
//  TableDetailViewController.h
//  StoryBookDemo
//
//  Created by 周武德 on 14/12/19.
//  Copyright (c) 2014年 周武德. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "gameTableViewController.h"
@class TableDetailViewController;
@class modelData;
@protocol PlayerDetailsViewControllerDelegate <NSObject>
- (void)playerDetailsViewControllerDidCancel:
(TableDetailViewController *)controller ;
- (void)playerDetailsViewControllerDidSave:
(TableDetailViewController *)controller data:(modelData *)data;
@end
@interface TableDetailViewController : UITableViewController<GamePickerViewControllerDelegate>

@property (nonatomic, weak) id <PlayerDetailsViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *nametextField;


- (IBAction)action1:(id)sender;
- (IBAction)action2:(id)sender;


@end
