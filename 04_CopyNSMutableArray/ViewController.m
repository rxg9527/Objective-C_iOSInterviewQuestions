//
//  ViewController.m
//  04_CopyNSMutableArray
//
//  Created by Yuen on 16/3/24.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSMutableArray *mutableArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *array = @[@1, @2, @3].mutableCopy;
    self.mutableArray = array;
    [self.mutableArray addObject:@4];
    
    /*
     atomic
     并不要求属性必须是“原子的”，因为这并不能保证“线程安全” (thread safety)
     一个线程在连续多次读取某属性值的过程中有别的线程在同时改写该值，那么即便将属性声明为 atomic，也还是会读到不同的属性值。
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
