//
//  intrinsicView.m
//  StoryBookDemo
//
//  Created by zhouwude on 15/12/24.
//  Copyright © 2015年 周武德. All rights reserved.
//

#import "intrinsicView.h"
@interface intrinsicView(){
    
    UILabel *label;
}
@end
@implementation intrinsicView
//从上面我们可以看到UIView是没有IntrinsicContentSize的，如果我们自定义一个View，想要他拥有默认宽高，只需要重写-IntrinsicContentSize方法，即可让其拥有默认的宽高。

-(instancetype)init{
    if (self = [super init]){
        
    }
    return self;
    
    
}
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


@end
