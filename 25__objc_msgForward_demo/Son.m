//
//  Son.m
//  Objective-C_iOSInterviewQuestions
//
//  Created by Yuen on 16/3/25.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "Son.h"
#import "ForwardingTarget.h"
#import <objc/runtime.h>

@interface Son ()

@property (nonatomic, strong) ForwardingTarget *target;

@end

@implementation Son

- (instancetype)init {
    if (self = [super init]) {
        _target = [ForwardingTarget new];
        [self performSelector:@selector(sel1) withObject:nil];
        [self performSelector:@selector(sel2) withObject:nil];
    }
    return self;
}

id dynamicMethodIMP(id self, SEL _cmd)
{
    NSLog(@"%s:动态添加的方法",__FUNCTION__);
    return @"1";
}

/**
 *  调用resolveInstanceMethod:方法 (或 resolveClassMethod:)。
    允许用户在此时为该 Class 动态添加实现。如果有实现了，则调用并返回YES，那么重新开始objc_msgSend流程。
    这一次对象会响应这个选择器，一般是因为它已经调用过class_addMethod。
    如果仍没实现，继续下面的动作。
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    class_addMethod(self.class, sel, (IMP)dynamicMethodIMP, "@@:");
    BOOL result = [super resolveInstanceMethod:sel];
    result = YES;
    return result; // 1
}

/**
 *  调用forwardingTargetForSelector:方法，尝试找到一个能响应该消息的对象。
    如果获取到，则直接把消息转发给它，返回非 nil 对象。
    否则返回 nil ，继续下面的动作。
    注意，这里不要返回 self ，否则会形成死循环。
 */
- (id)forwardingTargetForSelector:(SEL)aSelector {
//    id result = [super forwardingTargetForSelector:aSelector];
//    result = self.target;
//    return result;
    return nil;
}

/**
 *  调用methodSignatureForSelector:方法，尝试获得一个方法签名。
    如果获取不到，则直接调用doesNotRecognizeSelector抛出异常。
    如果能获取，则返回非nil：创建一个 NSlnvocation 并传给forwardInvocation:。
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    id result = [super methodSignatureForSelector:aSelector];
    NSMethodSignature *sig = [NSMethodSignature signatureWithObjCTypes:"v@:"];
    result = sig;
    return result;
}

/**
 *  调用forwardInvocation:方法，将第3步获取到的方法签名包装成 Invocation 传入，如何处理就在这里面了，并返回非ni。
 */
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    //    [super forwardInvocation:anInvocation];
    [self.target forwardInvocation:anInvocation];
}

/**
 *  调用doesNotRecognizeSelector: ，默认的实现是抛出异常。如果第3步没能获得一个方法签名，执行该步骤。
 */
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    // 在crash前 保存crash数据，供分析
    
    [super doesNotRecognizeSelector:aSelector]; // crash
}

@end
