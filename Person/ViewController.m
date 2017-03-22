//
//  ViewController.m
//  Person
//
//  Created by Doman on 17/3/22.
//  Copyright © 2017年 doman. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark 如果是自己测试，请先移步Build Setting -> 搜索msg -> 设置属性为No
    
    //对象方法做法1
    Person *p1 = [[Person alloc] init];
    [p1 name];
    
    //对象方法做法2
    Person *p2 = [[Person alloc] init];
    [p2 performSelector:@selector(name)];
    // SEL:方法编号,根据方法编号就可以找到对应方法实现，此方法其实就是运用了运行时。
    
    //类方法做法1
    [Person name];
    
    //类方法做法2--通过类对象调用
    [[Person class] name];
    
    
    
    // 让person发送消息-对象方法
    Person *p3 = [[Person alloc]init];
    
    objc_msgSend(p3,@selector(name));
    
    //类方法使用runtime
    // 获取类对象
    Class personClass = [Person class];
    
    objc_msgSend(personClass, @selector(name));
    
    
}



@end
