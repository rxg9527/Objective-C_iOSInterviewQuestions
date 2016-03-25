//
//  ForwardingTarget.m
//  Objective-C_iOSInterviewQuestions
//
//  Created by Yuen on 16/3/25.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ForwardingTarget.h"
#import <objc/runtime.h>

@implementation ForwardingTarget

id dynamicMethod(id self, SEL _cmd) {
    NSLog(@"%s:动态添加的方法", __FUNCTION__);
    return @"1";
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    class_addMethod(self.class, sel, (IMP)dynamicMethod, "@@:");
    BOOL result = [super resolveInstanceMethod:sel];
    result = YES;
    return result;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    id result = [super forwardingTargetForSelector:aSelector];
    return result;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    id result = [super methodSignatureForSelector:aSelector];
    return result;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [super forwardInvocation:anInvocation];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    [super doesNotRecognizeSelector:aSelector]; // crash
}

@end
