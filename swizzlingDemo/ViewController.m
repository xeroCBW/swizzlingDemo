//
//  ViewController.m
//  swizzlingDemo
//
//  Created by 陈博文 on 16/7/29.
//  Copyright © 2016年 陈博文. All rights reserved.
//

#import "ViewController.h"
#import "UIView+BackgroundColor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //这样是修改不了背景颜色的
//    self.view.backgroundColor = [UIColor greenColor];
    
    
    //修改背景颜色需要使用分类中的,使用的时候必须导入
 [self.view cbw_setBackgroundColor:[UIColor greenColor]];

  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  

   
    

}

@end
