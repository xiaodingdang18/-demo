//
//  main.m
//  TestMethodSwizzling
//
//  Created by zhaohf on 16/1/22.
//  Copyright © 2016年 RW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MethodSwizzlingHelp.h"
#import <objc/runtime.h>

#import "AddStringImp.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     /*
      
      方法交换之前打印3，方法交换之后打印为zhaohf，并且在其他类里面也打印zhaohf，说明方法替换修改的是类的方法列表，跟实例没有关系
      在viewcontroller里面不要这么重写NSArray方法，view的加载也是用到NSArray，会导致找不到view的方法而崩溃
      */
        
        NSArray *arr = @[@"1",@"2",@"3"];
        
        NSLog(@"before swizzling arr is %@",[arr lastObject]);
        
        [MethodSwizzlingHelp swizllingArrayLastObject];
        
        
        NSLog(@"after swizzling arr is %@",[arr lastObject]);
        AddStringImp *add = [[AddStringImp alloc]init];
        [add logArrayLastObject];
        
        //修改logArrayLastObject的实现方法
        [MethodSwizzlingHelp addFunc:[AddStringImp class]];
        [add logArrayLastObject];
        
        
    }
    return 0;
}

