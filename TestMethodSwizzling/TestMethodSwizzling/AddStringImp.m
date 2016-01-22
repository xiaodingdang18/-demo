//
//  AddStringImp.m
//  TestMethodSwizzling
//
//  Created by zhaohf on 16/1/22.
//  Copyright © 2016年 RW. All rights reserved.
//

#import "AddStringImp.h"

@implementation AddStringImp

- (void)logArrayLastObject
{
    NSArray *arr = @[@"123"];
    NSLog(@"last object is %@",[arr lastObject]);
}
@end
