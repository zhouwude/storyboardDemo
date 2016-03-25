//
//  AppDelegate.m
//  StoryBookDemo
//
//  Created by 周武德 on 14/12/18.
//  Copyright (c) 2014年 周武德. All rights reserved.
//

#import "AppDelegate.h"
#import "ZWDTableViewController.h"
#import "modelData.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    int a = 5;
    int *p = &a;
    long b=6;
    NSInteger  c= 9;
    //在 32位系统下面 pointer int long 都是4个字节
    // 但是在64位系统下  是 8 4 8  个字节。
    NSLog(@"                 NSInteger %lu",sizeof(c));
    NSLog(@"                 pointer %lu",sizeof(p));
    
    NSLog(@"                 int    %lu",sizeof(a));
    
    NSLog(@"                long  %lu",sizeof(b));
    
    players = [NSMutableArray arrayWithCapacity:20];
    modelData *player = [[modelData alloc] init];
    player.name = @"Bill Evans";
    player.game = @"Tic-Tac-Toe";
    player.rating = 4;
    [players addObject:player];
    player = [[modelData alloc] init];
    player.name = @"Oscar Peterson";
    player.game = @"Spin the Bottle";
    player.rating = 5;
    [players addObject:player];
    player = [[modelData alloc] init];
    player.name = @"Dave Brubeck";
    player.game = @"Texas Hold’em Poker";
    player.rating = 2;
    [players addObject:player];
    UITabBarController *tabBarController =
    (UITabBarController *)self.window.rootViewController;
    [tabBarController setEdgesForExtendedLayout:UIRectEdgeNone];
    UINavigationController *navigationController =
    [[tabBarController viewControllers] objectAtIndex:0];
   ZWDTableViewController *playersViewController =
    [[navigationController viewControllers] objectAtIndex:0];
    playersViewController.dataArray = players;
    for (int i = 0; i<5;i++){
    
    
    }
    //
    //我们在创建VC实例的时候可以直接调用这个函数，不用理会xib文件的问题，我们的父类在初始化的时候去自动帮我们找与之对应的xib文件，那么问题来了，父类怎么知道我有没有xib文件呢？是这样，父类会判断有没有和我们这个要初始化的VC相同名字的xib文件，如果有就会加载该xib文件，如果没有，父类就认为我们该VC没有xib文件，就会走正常的init方法。
    
    //果一旦我们的VC类的名字与对应的xib文件名字不同的时候，我们就必须调用这个初始化方法来创建VC实例了；
    //[[ViewController alloc] initWithNibName:@"xxx" bundle:[NSBundle mainBundle]]
    //基于UIView子类的xib的使用
    /*
     
     TestView *tView = [[NSBundle mainBundle] loadNibNamed:@"TestView" owner:self options:nil][0];
     
    
     上述代码再次说明xib文件是资源文件，放在main bundle中，@"TestView"是xib文件的名称，后面两个参数暂时不用了解，就固定传self和nil就行，值得说的是，loadNibNamed: owner: options方法返回的是一个数组，而不直接是对象，这是考虑到了Mac开发会有多个对象返回的情况，在iOS开发中就只有一个，固定取[0]就行。
     
     注：一般的UIView对象，代码初始化的时候都会调用initWithFrame:方法，但是用xib创建的UIView对象是不会调用此方法的，因为该对象的Frame在xib文件中就可以确定了。以xib的形式保存控件对象的过程其实叫做固化(archive)，通过xib文件创建控件的过程叫做解固(unarchive)，固化是iOS持久化的一种比较好的解决方案，以后有机会会说说iOS持久化的各种方式的优劣，这里不再深入，而与固化相关的初始化函数是：
     
     
  
     所以，当以xib创建UIView对象的时候这个函数会调用，之前在initWithFrame:中要做的事情，可以放在initWithCoder:中，或者放在：
     
     - (void)awakeFromNib
     {
     [super awakeFromNib];
     //...
     
     
     
    
     该函数会在initWithCoder:后调用，从名字我们就能看出，这个函数的触发时机是控件已经从xib文件中“解固”之后，两个函数之间的关系有点像VC的loadView和viewDidLoad之间的关系。
     }
     
     
     
     
 
     注：要删除连线，不仅要把Files Owner中的代码删除，还要找到xib中对应的对象，右键点击x删除，或直接选择第六个标签点击x删除。
     
     
     
     
     
     
    
     Files Owner指这个xib文件的所属文件是谁，简单的说是xib文件和谁建立起交互，用户通与该xib呈现的页面进行交互的时候，谁来处理背后的逻辑。具体来讲xib文件能拖动“连线”到哪个源文件中去建立IBAction、IBOutlet、delegate、datasource等。
     
     
  
     一般基于View创建的xib的Files Owner都指定为一个VC。基于VC创建的xib，创建的时候系统就已经把该xib文件的Files Owner指向了该VC，一般这种情况就不对Files Owner做修改了。
     
     设置Files Owner也是通过之前说的很重要的第三个标签下的Custom Class->Class来操作的，Files Owner、Custom Class的深入了解不是一蹴而就的，要在不断地学习和应用中去体会，后面会有例子涉及到他们到时候认识会更深。
     
   
     注意静态cell一定要基于UITableViewController，否则会报错。
     展示静态cell的tableView是不用调用自己必须实现的datasource协议的
     */
    
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
