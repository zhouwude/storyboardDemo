//
//  zhouwudeViewController.m
//  StoryBookDemo
//
//  Created by 周武德 on 14/12/24.
//  Copyright (c) 2014年 周武德. All rights reserved.
//

#import "zhouwudeViewController.h"
#import "secondViewController.h"
@interface zhouwudeViewController ()

@end

@implementation zhouwudeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//这个方法用来重写，为跳转时（也就是从一个viewcontroller换到另一个viewcontroller）系统自动调用。传入的identifier参数表示Segue的id。默认是返回yes，返回no的话表示不执行跳转。可根据identifier参数设置分支语句，屏蔽相应的跳转。（注意，调用performSegueWithIdentifier并不会调用该方法，也就是说，这个方法即使返回no，也并不能阻止performSegueWithIdentifier执行跳转）
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    return NO;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UINavigationController *nc = segue.destinationViewController;
    secondViewController *vc = nc.viewControllers[0];
    vc.data = self.textField.text;
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (IBAction)zhouwde:(id)sender {
    //
    [self performSegueWithIdentifier:@"second" sender:self];
    NSLog(@"second");
    NSLog(@"second");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
