//
//  Son.m
//  Objective-C_iOSInterviewQuestions
//
//  Created by Yuen on 16/3/25.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "Son.h"

@implementation Son

- (instancetype)init {
    if (self = [super init]) {
        [self performSelector:@selector(sel1) withObject:nil];
        [self performSelector:@selector(sel2) withObject:nil];
    }
    return self;
}

/**
 *  调用resolveInstanceMethod:方法 (或 resolveClassMethod:)。
    允许用户在此时为该 Class 动态添加实现。如果有实现了，则调用并返回YES，那么重新开始objc_msgSend流程。
    这一次对象会响应这个选择器，一般是因为它已经调用过class_addMethod。
    如果仍没实现，继续下面的动作。
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return YES;
}

@end
