//
//  UIView+BackgroundColor.m
//  swizzlingDemo
//
//  Created by 陈博文 on 16/7/29.
//  Copyright © 2016年 陈博文. All rights reserved.
//

#import "UIView+BackgroundColor.h"
#import <objc/runtime.h>
@implementation UIView (BackgroundColor)

/**
 *  重写 load 方法之后, UIView 直接交换,会使用定义的方法,变成红色
 */

+(void)load{
    
    Method method1 = class_getInstanceMethod(self, @selector(setBackgroundColor:));
    Method method2 = class_getInstanceMethod(self, @selector(cbw_setBackgroundColor:));
    
    method_exchangeImplementations(method1, method2);
    
}

- (void)cbw_setBackgroundColor:(UIColor *)backgoroundColor{
    
    
    //这里面就使用自己的方法--会调换成系统的方法
    
    [self cbw_setBackgroundColor:[UIColor redColor]];
    
}

//分类中重写父类的方法,有两种

//1. 不需要使用 super 父类的方法,可以直接重写

//2. 调用父类的方法,使用 runtime


//-(void)setBackgroundColor:(UIColor *)backgroundColor{
//    
//    backgroundColor = [UIColor greenColor];
//    
////这里是使用不了super 的
////    [super setBackgroundColor:backgroundColor];
//    
//}



@end
