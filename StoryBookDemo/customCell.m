//
//  customCell.m
//  StoryBookDemo
//
//  Created by 周武德 on 15/9/11.
//  Copyright (c) 2015年 周武德. All rights reserved.
//

#import "customCell.h"

@implementation customCell
-(void)awakeFromNib{
    _contentview.layer.cornerRadius = 4;
    _containrView.layer.shadowColor = [UIColor blueColor].CGColor;
    _containrView.layer.shadowOffset = CGSizeMake(2, 2);
    _containrView.layer.opaque = 0.5;
    _containrView.layer.shadowRadius = 5;
    UILongPressGestureRecognizer *longGes = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    [self.contentview addGestureRecognizer:longGes];
    
   // [_containrView snapshotViewAfterScreenUpdates:YES];
    
}
-(void)click:(UILongPressGestureRecognizer *)ges{
    
    
    
}
@end
