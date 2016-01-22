//
//  MethodSwizzlingHelp.m
//  TestMethodSwizzling
//
//  Created by zhaohf on 16/1/22.
//  Copyright © 2016年 RW. All rights reserved.
//

#import "MethodSwizzlingHelp.h"
#import <objc/runtime.h>
#import "AddStringImp.h"

@implementation MethodSwizzlingHelp


+ (void)swizllingArrayLastObject
{
    Method ori_Method =  class_getInstanceMethod([NSArray class], @selector(lastObject));
    Method my_Method = class_getInstanceMethod([NSArray class], @selector(myArrayLastObject));
    method_exchangeImplementations(ori_Method, my_Method);
}

- (NSString *)myArrayLastObject
{
    //NSString *ret = [self myArrayLastObject];
    //NSLog(@"my array last object");
    
    return [NSString stringWithFormat:@"my string %@",@"zhaohf"];
    
    
}

+ (void)addFunc:(Class)forclass
{
    Method oldMethod = class_getInstanceMethod([AddStringImp class], @selector(logArrayLastObject));
    Method newMethod = class_getInstanceMethod([self class], @selector(myAddFuncImp));
    method_setImplementation(oldMethod, method_getImplementation(newMethod));
}

- (void)myAddFuncImp
{
    NSLog(@"add function sucess !");
}
@end
