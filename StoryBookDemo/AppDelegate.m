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
