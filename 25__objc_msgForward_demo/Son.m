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

@end
