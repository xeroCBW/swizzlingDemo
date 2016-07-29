###分类中重写父类的方法
- 1.不需要调用 super,即不需要使用父类中的方法,分类中使用不了 super 的----直接重写就可以
- 2.需要使用父类中的方法----使用 runtime
	
	
下面以需要调用父类的方法举例,修改背景颜色

UIView (BackgroundColor)的.h 文件

```

//
//  UIView+BackgroundColor.h
//  swizzlingDemo
//
//  Created by 陈博文 on 16/7/29.
//  Copyright © 2016年 陈博文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BackgroundColor)

- (void)cbw_setBackgroundColor:(UIColor *)backgoroundColor;


//-(void)setBackgroundColor:(UIColor *)backgroundColor;

@end

```

UIView (BackgroundColor)的.m 文件


```
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

@end
```

运行完成之后,直接所有背景颜色变成红色,不管你在 viewController 中设置成绿色,结果还是红色
`self.view.backgroundColor = [UIColor greenColor];`

您需要直接使用设置背景颜色

`[self.view cbw_setBackgroundColor:[UIColor greenColor]];`



