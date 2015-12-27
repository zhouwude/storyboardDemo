//
//  ZWDIntrinsicViewController.m
//  StoryBookDemo
//
//  Created by zhouwude on 15/12/24.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "ZWDIntrinsicViewController.h"
#import "UICoordinateSpaceCon.h"
@interface ZWDIntrinsicViewController ()
@property (weak, nonatomic) IBOutlet UILabel *click;

@end

@implementation ZWDIntrinsicViewController
- (IBAction)clickBut:(id)sender {
    
    [self.navigationController pushViewController:[[UICoordinateSpaceCon alloc] init] animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   // 用Autolayout之后，一个比较爽的地方就是UIlabel，UIButton, UIImageView有了IntrinsicContentSize的属性。他们可以自己根据内容调整大小，再也不用量宽和高了。设置好位置之后，就让他们自己浪吧，文字有多长就显示多长，图片有多大，就显示多大，真是Very Nice~~
    //对于哪些View有IntrinsicContentSize，Apple给了一张表:
    //UIView和NSView是没有IntrinsicContentSize的。
    //Sliders只有with有这个属性。 Sliders只能定义width。Sliders的height拥有IntrinsicContentSize(感谢@凸小布，发现了这个问题)
    //Labels, buttons, switches, text fields比较棒，属性完美支持
   // Text views和image views也挺好，在有内容的时候支持，没有内容的时候不支持。这也正是我们想要的
    
    //outlayout  IntrinsicContentSize
    //- (NSArray *)constraints NS_AVAILABLE_IOS(6_0);
    
    //- (void)addConstraint:(NSLayoutConstraint *)constraint NS_AVAILABLE_IOS(6_0);
    //- (void)addConstraints:(NSArray *)constraints NS_AVAILABLE_IOS(6_0);
    //- (void)removeConstraint:(NSLayoutConstraint *)constraint NS_AVAILABLE_IOS(6_0);
    // - (void)removeConstraints:(NSArray *)constraints NS_AVAILABLE_IOS(6_0);
    //以上这五个API中，第一个是返回当前View中所有的constraints。后面四个方法即将被废弃，应该使用NSLayoutConstraint类中activateConstraint 和 deactivateConstraints相关方法替代。（这是ios8以后的方法）
    
    
    // Do any additional setup after loading the view from its nib.
    
    
   // 测试一下
    
    
    UIView *view = [UIView new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor colorWithRed:0.2987 green:0.3255 blue:1.0 alpha:1.0];
    [self.view addSubview:view];
    //NSDictionary *dic = NSDictionaryOfVariableBindings(view);
    NSLayoutConstraint *t1 = [self.view.leadingAnchor constraintEqualToAnchor:view.leadingAnchor constant:-64];
     NSLayoutConstraint *t2 = [self.view.topAnchor constraintEqualToAnchor:view.topAnchor constant:-64];
     NSLayoutConstraint *t3 = [view.widthAnchor constraintEqualToConstant:100];
     NSLayoutConstraint *t4 = [view.heightAnchor constraintEqualToConstant:100];
    //ios8以前的方法
   // [self.view addConstraints:@[t1,t2,t3,t4]];
    //>8推荐使用这个方法
    [NSLayoutConstraint activateConstraints:@[t1,t2,t3,t4]];
    
    
    
    
    /*@interface UIView (UIConstraintBasedLayoutCoreMethods)
     - (void)updateConstraintsIfNeeded NS_AVAILABLE_IOS(6_0);
     - (void)updateConstraints NS_AVAILABLE_IOS(6_0);
     - (BOOL)needsUpdateConstraints NS_AVAILABLE_IOS(6_0);
     - (void)setNeedsUpdateConstraints NS_AVAILABLE_IOS(6_0);
     @end 
     setNeedsUpdateConstraints ： 当一个自定义的View某一个属性的改变可能影响到界面布局，我们应该调用这个方法来告诉布局系统在未来某个时刻需要更新。系统会调用updateConstraints去更新布局。
     
     updateConstraints ：自定义View时，我们应该重写这个方法来设置当前view局部的布局约束。重写这个方法时，一定要调用[super updateConstraints]。
     
     needsUpdateConstraints ：布局系统使用这个返回值来确定是否调用updateConstraints
     
     updateConstraintsIfNeeded ：我们可以调用这个方法触发update Constraints的操作。在needsUpdateConstraints返回YES时，才能成功触发update Constraints的操作。我们不应该重写这个方法。
     
     Auto Layout的布局过程是 update constraints(updateConstraints)-> layout Subviews(layoutSubViews)-> display(drawRect) 这三步不是单向的，如果layout的过程中改变了constrait, 就会触发update constraints，进行新的一轮迭代。我们在实际代码中，应该避免在此造成死循环。
     */
    
    
    
    /*
     
     @interface UIView (UIConstraintBasedCompatibility)
     
     - (BOOL)translatesAutoresizingMaskIntoConstraints NS_AVAILABLE_IOS(6_0);
     - (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)flag NS_AVAILABLE_IOS(6_0);
     
     + (BOOL)requiresConstraintBasedLayout NS_AVAILABLE_IOS(6_0);
     
     @end
     默认情况下，View的autoresizing工作会根据当前位置自动设置约束。我们在使用代码写自己的约束布局代码时，必须设置当前View的translatesAutoresizingMaskIntoConstraints为NO，否则无法正常运作。IB默认是NO。
     
     requiresConstraintBasedLayout ：我们应该在自定义View中重写这个方法。如果我们要使用Auto Layout布局当前视图，应该设置为返回YES。
     
     
     */
    
    /*UIConstraintBasedLayoutLayering
     
     - (CGRect)alignmentRectForFrame:(CGRect)frame NS_AVAILABLE_IOS(6_0);
     - (CGRect)frameForAlignmentRect:(CGRect)alignmentRect NS_AVAILABLE_IOS(6_0);
     - (UIEdgeInsets)alignmentRectInsets NS_AVAILABLE_IOS(6_0); 
     
     AutoLayout并不会直接操作View的Frame，但是视图的alignment rect是起作用的。视图的默认alignmentRectInsets值就是(0,0,0,0)。
     我们可以简单的对当前View设置用来布局的矩形，比如：
     
     我们有一个自定义icon类型的Button，但是icon的大小比我们期望点击的Button区域要小。这个时候我们可以重写alignmentRectInsets，把icon放在适当的位置。
     
     大多数情况下重写alignmentRectInsets这个方法可以满足我们的工作。如果需要更加个性化的修改，我们可以重写alignmentRectForFrame和frameForAlignmentRect这两个方法。比如我们不想减去视图固定的Insets，而是需要基于当前frame修改alignment rect。在重写这两个方法时，我们应该确保是互为可逆的。
     */
    
    /*
     - (UIView *)viewForBaselineLayout NS_AVAILABLE_IOS(6_0);
     当我们在使用布局约束中NSLayoutAttributeBaseline属性时，系统会默认返回当前视图的底部作为baseline。我们可以重写上述方法，但必须返回的是当前视图中的子视图。
     
     */
    
    
    /*
     
     Intrinsic Content Size
     
     
     
     UIKIT_EXTERN const CGFloat UIViewNoIntrinsicMetric NS_AVAILABLE_IOS(6_0);
     - (CGSize)intrinsicContentSize NS_AVAILABLE_IOS(6_0);
     - (void)invalidateIntrinsicContentSize NS_AVAILABLE_IOS(6_0);
     
     - (UILayoutPriority)contentHuggingPriorityForAxis:(UILayoutConstraintAxis)axis NS_AVAILABLE_IOS(6_0);
     - (void)setContentHuggingPriority:(UILayoutPriority)priority forAxis:(UILayoutConstraintAxis)axis NS_AVAILABLE_IOS(6_0);
     
     - (UILayoutPriority)contentCompressionResistancePriorityForAxis:(UILayoutConstraintAxis)axis NS_AVAILABLE_IOS(6_0);
     - (void)setContentCompressionResistancePriority:(UILayoutPriority)priority forAxis:(UILayoutConstraintAxis)axis NS_AVAILABLE_IOS(6_0);
     通过重写intrinsicContentSize可以设置当前视图显示特定内容时的大小。比如我们设置一个自定义View，View里面包含一个Label显示文字，为了设置当前View在不同Size Class下内容的大小，我们可以这样:
     
     - (CGSize)intrinsicContentSize
     {
     CGSize size = [label intrinsicContentSize];
     if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact) {
     size.width += 4.0f;
     } else {
     size.width += 40.0f;
     }
     
     if (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
     size.height += 4.0;
     } else {
     size.height += 40.0;
     }
     
     return size;
     }
     
     
     */
    
    
 
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
