//
//  TableDetailViewController.m
//  StoryBookDemo
//
//  Created by 周武德 on 14/12/19.
//  Copyright (c) 2014年 周武德. All rights reserved.
//

#import "TableDetailViewController.h"
#import "modelData.h"
@interface TableDetailViewController (){
    NSString *game;
}

@end

@implementation TableDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nametextField.text = game;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.nametextField resignFirstResponder];
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

- (IBAction)action1:(id)sender {
    [self.delegate playerDetailsViewControllerDidCancel:self];
    
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"%f  %f",velocity.x,velocity.y);
    
    
    
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
         game = @"Chess";
        NSLog(@"init PlayerDetailsViewController");
    }
    return self;
}
- (void)dealloc
{
    NSLog(@"dealloc PlayerDetailsViewController");
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    scrollView.decelerationRate = 1.0;
}
- (IBAction)action2:(id)sender {
    
    
    modelData *data = [[modelData alloc] init];
    data.name = @"heheheh";
    data.game = self.nametextField.text;
    
    [self.delegate playerDetailsViewControllerDidSave:self  data:data];
   
   
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"gameSugue"]){
    
        gameTableViewController *vc = segue.destinationViewController;
        vc.delegate = self;
        vc.game = game;
        
    }
    
}
-(void)gamePickerViewController:(gameTableViewController *)controller didSelectGame:(NSString *)thegame{
    game = thegame;
    self.nametextField.text = game;
    [controller.navigationController popViewControllerAnimated:YES];
}
@end
