//
//  TestView.m
//  StoryBookDemo
//
//  Created by zhouwude on 16/3/24.
//  Copyright © 2016年 周武德. All rights reserved.
//

#import "TestView.h"

@implementation TestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
/*
 
 Files Owner指这个xib文件的所属文件是谁，简单的说是xib文件和谁建立起交互，用户通与该xib呈现的页面进行交互的时候，谁来处理背后的逻辑。具体来讲xib文件能拖动“连线”到哪个源文件中去建立IBAction、IBOutlet、delegate、datasource等。
 
 
 
 一般基于View创建的xib的Files Owner都指定为一个VC。基于VC创建的xib，创建的时候系统就已经把该xib文件的Files Owner指向了该VC，一般这种情况就不对Files Owner做修改了。
 
 设置Files Owner也是通过之前说的很重要的第三个标签下的Custom Class->Class来操作的，Files Owner、Custom Class的深入了解不是一蹴而就的，要在不断地学习和应用中去体会，后面会有例子涉及到他们到时候认识会更深。
 
 基于view的xib

 我们可能会遇到这种情况：要封装一个View为一个单独的类，该View是可交互的，点击后，要发生变化，同时又要把交互的事件传递给VC，如果用代码的话，就要把事件从View类传递给VC类，而如果你封装的类用了xib，那么事情就简单多了，同时“连线”到View类和自己Files Owner类对应的VC中，在View类中处理UI的变化，在VC中处理逻辑，而不需要任何事件的传递，当用户交互的时候，这两根“连线”都会被回调。
 将 view的class指定为目标.h 和.m文件 将 file own指定为一个 VC 则view.xib也可以向VC连接
 
 */
@end
