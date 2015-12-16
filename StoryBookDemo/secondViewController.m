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
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:100]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:100]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:100]];
    //
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor redColor];
    [self.view addSubview:view2];
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    // 这玩意就相遇顶部的 navibar 隐藏 就相当于消失 id类型 self。bottomGuide相当于底部的 bar
    id top = self.topLayoutGuide;
    NSDictionary *dic = NSDictionaryOfVariableBindings(view2,top);
    NSDictionary *dic1 = @{@"hh":@(20)};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[top]-hh-[view2(100)]" options:0 metrics:dic1 views:dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-300-[view2(20)]" options:0 metrics:dic1 views:dic]];

}
-(BOOL)prefersStatusBarHidden{
    return YES;
    
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
