//
//  secondViewController.m
//  StoryBookDemo
//
//  Created by 周武德 on 14/12/24.
//  Copyright (c) 2014年 周武德. All rights reserved.
//

#import "secondViewController.h"
#import "thirdViewController.h"
#import "DestinationViewCon.h"
@interface secondViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *myConstrain;

@end

@implementation secondViewController
- (IBAction)clickiii:(id)sender {
    //使用手动sugue的时候 第一个参数是 sugue的 identi表示服 第二个参数表示 要发送的数据 与
    [self performSegueWithIdentifier:@"zhouwude" sender:@"send Message"];
    
}
//应该是你的segue是从按钮指向新页面的，也就是由按钮触发segue。所以sender指向按钮了。如果是navigation controller，页面之间创建segue，那么sender就是页面。另外在代码中，显示执行- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender，可以将传进你想赋予的源头，即页面而不是button为sender。
//由于 对方 似一个子类的Viewcontroller 所以我们可以使用KVC的方式传值。
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    UIViewController *view = segue.destinationViewController;
    //这里的sender的就是上一个方法中 [self performSegueWithIdentifier:@"zhouwude" sender:@"send Message"]; 中sender的值。如果没有使用手动segue方法则sender的值为 你点击跳转的那个按钮 比如你点击一个button 跳转到下一个页面 则sender就是那个button
    NSLog(@"    +++++++%@",sender);
    // 避免警告 使用 kvc传值
    if ([view respondsToSelector:@selector(setZhouwude:)]){
      [view setValue:sender forKey:@"zhouwude"];
    }
  //  [view setValue:@"" forKey:@""];
    
}
- (IBAction)click:(id)sender {
    
    [UIView animateWithDuration:2 animations:^{
        if (self.myConstrain.constant>100){
            
            self.myConstrain.constant = 50;
            
        }else{
            
            self.myConstrain.constant = 200;
            
        }
        // 给autolayout添加动画效果
        [self.view layoutIfNeeded];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidload");
    
    
    // 核心  使用AutoLayout之后，把view显示到屏幕上面大体分成3步。
    
//    Update constraints
//    Layout views
//    Display
    
    
    
    self.secField.text = self.data;
    self.view.layoutMargins = UIEdgeInsetsMake(50, 50, 50, 50);
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    //从iOS 7以来，当我们的视图控制器结构中有NavigationBar，TabBar或者ToolBar的时候，它们的translucent属性的默认值改为了YES，并且当前的ViewController的高度会是整个屏幕的高度。（比如一个场景：拖动TableView的时候，上面的NavigationBar能够透过去看到TableView的内容。）
    
    //为了确保我们的视图不被这些Bar覆盖，我们可以在我们AutoLayout布局中使用topLayoutGuide和bottomLayoutGuide这两个属性。像这样：
    //NSDictionary *views = @{"topLayoutGuide" : self.topLayoutGuide, @"myLabel" : myLabel};
    //[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topLayoutGuide]-[myView]" options:0 metrics:nil views:views]
    
    //如果我们不使用AutoLayout布局，我们也可以通过Guide的length属性获得相应的距离。我们应该在-viewDidLayoutSubviews或者-layoutSubviews调用super之后，再去获得length这个值，以确保正确。

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:100]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:100]];
    //
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor redColor];
    [self.view addSubview:view2];
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    // 这玩意就相遇顶部的 navibar 隐藏navigationbar  就相当于消失控件会自动上移 id类型 self。bottomGuide相当于底部的 bar
    // margin 苹果 空间之间 默认 是8 与self.view 为margin为20 去掉 relative to margin 则可以 从零开始
    id top = self.topLayoutGuide;
    //这个方法快速创建一个 字典 相当于将其本身作为key值 然后再去将其 值作为value
    NSDictionary *dic = NSDictionaryOfVariableBindings(view2,top);
    //这个值 必须是number类型  且也可以用上面的方法去创建
    NSDictionary *dic1 = @{@"hh":@(20)};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[top]-hh-[view2(100)]" options:0 metrics:dic1 views:dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-300-[view2(20)]" options:0 metrics:dic1 views:dic]];
    //在 iOS 9 中引入的NSLayoutAnchorAPI 不仅让约束声明更加清晰明了，而且还通过静态类型检查以确保您的约束保证能够正常工作。比如说，我们有一个约束，是使用旧有的NSLayoutConstraintAPI 进行创建的。
    
    //NSLayoutConstraint *constraint =
  //  [NSLayoutConstraint constraintWithItem:view1
//                                 attribute:NSLayoutAttributeLeading
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:view2
//                                 attribute:NSLayoutAttributeTop
//                                multiplier:1.0
//                                  constant:0.0];
    
    //这个约束是无效的，因为我们为 X 轴（左侧）属性以及 Y 轴（顶部）属性建立了一个相等的约束。然而，这种做法不会得到任何警告，它能够继续运行，然后_悄悄_地崩溃掉，让您的约束处于一个未定义的状态，接着留下一个棘手的烂摊子让您来处理，没有任何的记录能够提醒您，以便让您确认在几十个（甚至数百、上千）约束中哪一个出现了问题。
    
    //NSLayoutAnchor通过使用在 Swift 和 Objective-C 中存在的泛型特性很好地解决了这个问题。UIView上的锚点访问器(anchor accessors) 能够显示为继承自NSLayoutAnchor方法添加类型信息的NSLayoutAnchor的子类。对于 X 轴、Y 轴以及尺寸（宽、高） 锚点来说，都有着不同的NSLayoutAnchor子类，因为某个类型的锚点只能够被与之相同类型的其他锚点所约束。通过NSLayoutAnchor中的方法来约束锚点参数以及作为接收器的相同泛型类型，API 变能够使用类型检查以确保能够创建出有效的约束。
    
   // 让我们再回到前面的例子来，这里是一个使用NSLayoutAnchorAPI 的等价约束声明：
    
    //NSLayoutConstraint *constraint =
    //[view1.leadingAnchor constraintEqualToAnchor:view2.topAnchor];
    //只使用  ios9.0以上
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor redColor];
    [self.view addSubview:view3];
    view3.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraint:[view3.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:10]];
    [self.view addConstraint:[view3.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:400]];
    [self.view addConstraint:[view3.widthAnchor constraintEqualToConstant:100]];
    [self.view addConstraint:[view3.heightAnchor constraintEqualToConstant:100]];
    
  //  UILayoutGuide
    //// 创建Layout Guide
    UILayoutGuide* layoutGuideA = [[UILayoutGuide alloc] init];
    UILayoutGuide* layoutGuideB = [[UILayoutGuide alloc] init];
    
    // 将它们添加到视图上
    [self.view addLayoutGuide:layoutGuideA];
    [self.view addLayoutGuide:layoutGuideB];
    // 使用它们添加约束
   // layoutGuideA.heightAnchor =  layoutGuideB.heightAnchor;
    
    // 您甚至可以设置它们的标识符...
    layoutGuideA.identifier = @"layoutGuideA";
    layoutGuideB.identifier = @"layoutGuideB";
    NSLog(@"-------%@----",NSStringFromUIEdgeInsets(self.view.layoutMargins));
    
    //self.view.layoutMargins   ios8.0
    //self.view.layoutMarginsGuide ios9.0
    // 然后使用它们可以得到计算后的视图尺寸（只有当拥有 Layout Guide 的视图出现之后才有效)
    //print("layoutGuideA.layoutFrame -> \(layoutGuideA.layoutFrame)")


    
    
    

}
/*
 
 我们从 View Controller 的生命周期来分析这个问题：
 
 viewDidLoad
 viewWillAppear
 viewWillLayoutSubviews
 viewDidLayoutSubviews
 viewDidAppear
 viewWillDisappear
 viewDidDisappear

 */
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    NSLog(@"viewwillayoutsubview");
    NSLog(@"获得 topALyoutguide  will 的 %@",@(self.topLayoutGuide.length));
    
}
-(void)viewDidLayoutSubviews{
    NSLog(@"viewdidayoutsubview");
    [super viewDidLayoutSubviews];
    
    
    NSLog(@"获得 topALyoutguide  did 的 %@",@(self.topLayoutGuide.length));
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"viewwillappear");
    [super viewWillAppear:animated];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"---viewdidappear");
    
}
-(BOOL)prefersStatusBarHidden{
    BOOL a = arc4random()%2;
    return a;
    
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
