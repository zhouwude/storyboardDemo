//
//  ZWDTableViewController.m
//  StoryBookDemo
//
//  Created by 周武德 on 14/12/18.
//  Copyright (c) 2014年 周武德. All rights reserved.
//

#import "ZWDTableViewController.h"
#import "modelData.h"
#import "CusTableViewCell.h"
#import "ZWDIntrinsicViewController.h"
@interface ZWDTableViewController ()

@end

@implementation ZWDTableViewController
- (void)playerDetailsViewControllerDidCancel:
(TableDetailViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)playerDetailsViewControllerDidSave:
(TableDetailViewController *)controller data:(modelData *)data
{
  
    [self.dataArray addObject:data];
    NSIndexPath *indexPath =
    [NSIndexPath indexPathForRow:[self.dataArray count] - 1
                       inSection:0];
    [self.tableView insertRowsAtIndexPaths:
     [NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"jjjjjjjjj%@",sender);
    if ([segue.identifier isEqualToString:@"AddPlayer"])
    {
        UINavigationController *navigationController =
        segue.destinationViewController;
        TableDetailViewController
        *playerDetailsViewController =
        [[navigationController viewControllers]
         objectAtIndex:0];
        playerDetailsViewController.delegate = self;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //ios7新加的方法，，再有的时候会出现偏差，，家是哪个这个方法就oK了
    NSLog(@"hwdwjqdijqiq");
    
   // [self setEdgesForExtendedLayout:UIRectEdgeNone];
   
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
   [self.tableView registerClass:[CusTableViewCell class] forCellReuseIdentifier:@"cell"];
   
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    // 在这里可以屏蔽方法之间的跳转。。。。可以根据相应的identifier的屏蔽相应的方法。
    
    return YES;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[[ZWDIntrinsicViewController alloc] init] animated:YES];
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.dataArray.count;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:0];
        
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //使用这句话就不需要使用什么 if（cell ==  nil）
   CusTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSLog(@"  %f   %f",cell.frame.size.height,cell.contentView.frame.size.height);
    modelData *player = [self.dataArray objectAtIndex:indexPath.row];
    [cell confifUI:player];
    [NSLayoutConstraint constraintWithItem:[UIView new] attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
