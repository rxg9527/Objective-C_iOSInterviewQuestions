//
//  ViewController.m
//  13_PropertyStrongArray
//
//  Created by Yuen on 16/3/24.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *mArray = @[@1, @2, @3].mutableCopy;
    self.array = mArray;
    NSLog(@"%@", self.array);
    [mArray addObject:@4];
    NSLog(@"%@", self.array);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
