//
//  UICoordinateSpaceCon.m
//  StoryBookDemo
//
//  Created by zhouwude on 15/12/24.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "UICoordinateSpaceCon.h"

@interface UICoordinateSpaceCon ()
{
    UIView *myView;
}
@end

@implementation UICoordinateSpaceCon

- (void)viewDidLoad {
    [super viewDidLoad];
    //详解UICoordinateSpace和UIScreen在iOS 8上的坐标问题

    self.view.backgroundColor = [UIColor whiteColor];
    myView = [[UIView alloc] init];
  myView.layer.backgroundColor= [UIColor greenColor].CGColor;
    myView.frame = CGRectMake(50, 50, 200, 200);
    //
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    [self.view.window addSubview:myView];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//UITraitEnvironment 协议 只要UITraitCollection 发生变化
//Apple在iOS8中引入了一个新的类，UITraitCollection。这个类封装了像水平和竖直方向的Size Class等信息。iOS8的UIKit中大多数UI的基础类(包括UIScreen,UIWindow,UIViewController和UIView)都实现了UITraitEnvironment这个接口，通过其中的traitCollection这个属性，我们可以拿到对应的UITraitCollection对象，从而得知当前的Size Class，并进一步确定界面的布局。和UIKit中的响应者链正好相反，traitCollection将会在view hierarchy中自上而下地进行传递。对于没有指定traitCollection的UI部件，将使用其父节点的traitCollection。这在布局包含childViewController的界面的时候会相当有用。在UITraitEnvironment这个接口中另一个非常有用的是-traitCollectionDidChange:。在traitCollection发生变化时，这个方法将被调用。在实际操作时，我们往往会在ViewController中重写-traitCollectionDidChange:或者-willTransitionToTraitCollection:withTransitionCoordinator:方法(对于ViewController来说的话，后者也许是更好的选择，因为提供了转场上下文方便进行动画；但是对于普通的View来说就只有前面一个方法了)，然后在其中对当前的traitCollection进行判断，并进行重新布局以及动画。代码看起来大概会是这个样子：
-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    BOOL landscape = (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight);
    NSLog(@"Currently landscape: %@, width: %.2f, height: %.2f",
          (landscape ? @"Yes" : @"No"),
          [[UIScreen mainScreen] bounds].size.width,
          [[UIScreen mainScreen] bounds].size.height);
    NSLog(@"nav frame %@  status bar %@",NSStringFromCGRect(self.navigationController.navigationBar.frame),NSStringFromCGRect([UIApplication sharedApplication].statusBarFrame));
}
- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection
              withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    [super willTransitionToTraitCollection:newCollection
                 withTransitionCoordinator:coordinator];
    //iOS8之后，像上文描述的那样，window和screen的坐标会随着app旋转而改变。也不总是这样的情况，因为View Controller仍然决定了App在当前视图下支持哪几个方向。 在某些时候，我们需要一些修正之后的frame（比如需要存储touch事件在屏幕上的坐标），这个时候新的UICoordinateSpace就登场了。
    
   // UICoordinateSpace协议的接口如上，使用这些接口我们可以从当前视图的坐标转化到在screen的坐标体系当中，像这样：
   // [myView convertPoint:point toCoordinateSpace:myView.window.screen.fixedCoordinateSpace];
    
    //@property (readonly) id <UICoordinateSpace> coordinateSpace NS_AVAILABLE_IOS(8_0);
   // @property (readonly) id <UICoordinateSpace> fixedCoordinateSpace NS_AVAILABLE_IOS(8_0);
   // coordinateSpace值的是当前screen旋转之后的坐标体系，fixedCoordinateSpace指的是修正之后的坐标体系。我们同样可以把screen的坐标转换到当前视图的坐标体系，如下：
    //[myView.window.screen.fixedCoordinateSpace convertPoint:point      toCoordinateSpace:myView];
    
    
    //举个例子来说，在iPhone 5的屏幕大小上(320 * 568)，myView在竖屏方向的frame是CGRectMake(50, 50, 200, 200)，myView的Super View是window。有如下输出结果：
    
    CGPoint point = [myView convertPoint:CGPointMake(0, 0) toCoordinateSpace:[UIScreen mainScreen].fixedCoordinateSpace];
    NSLog(@"fixedCoordinateSpace %@", NSStringFromCGPoint(point)); // {50, 50}
    
    point = [myView convertPoint:CGPointMake(0, 0) toCoordinateSpace:[UIScreen mainScreen].coordinateSpace];
    NSLog(@"coordinateSpace %@", NSStringFromCGPoint(point)); // {50, 50}
  //  此时我们把设备顺时针旋转90度，在这两种不同的坐标体系下分别输出的结果是：
//    NSLog(@"fixedCoordinateSpace %@", NSStringFromCGPoint(point)); // {50, 518}
//    
//    NSLog(@"coordinateSpace %@", NSStringFromCGPoint(point)); // {50, 50}
    
    
    [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context)
     {
         if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
             //To Do: modify something for compact vertical size
         } else {
             //To Do: modify something for other vertical size
         }
         [self.view setNeedsLayout];
     } completion:nil];
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
