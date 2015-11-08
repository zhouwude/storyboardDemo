//
//  secondViewController.m
//  StoryBookDemo
//
//  Created by 周武德 on 14/12/24.
//  Copyright (c) 2014年 周武德. All rights reserved.
//

#import "secondViewController.h"
#import "thirdViewController.h"
@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.secField.text = self.data;
    // Do any additional setup after loading the view.
}
- (IBAction)enter:(id)sender {
    thirdViewController *vc = [[thirdViewController alloc] initWithNibName:@"thirdViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back:(id)sender {
    
    //直接跳转
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)enterThrid:(id)sender {
    
    [self performSegueWithIdentifier:@"thrid" sender:self];
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
