//
//  basicCellCon.m
//  StoryBookDemo
//
//  Created by 周武德 on 15/9/11.
//  Copyright (c) 2015年 周武德. All rights reserved.
//

#import "basicCellCon.h"
@interface basicCellCon()<UITableViewDelegate,UITableViewDataSource>
@end
@implementation basicCellCon
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
  
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200.0f;
}
@end
