//
//  windeSegueViewController.m
//  StoryBookDemo
//
//  Created by 周武德 on 14/12/26.
//  Copyright (c) 2014年 周武德. All rights reserved.
//

#import "windeSegueViewController.h"

@interface windeSegueViewController ()

@end

@implementation windeSegueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIViewController *vc=  segue.destinationViewController;
    vc.hidesBottomBarWhenPushed = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)unwindSegueToRedViewController:(UIStoryboardSegue *)segue {
    
    
    
    
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
