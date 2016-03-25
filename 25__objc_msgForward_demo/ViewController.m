//
//  ViewController.m
//  25__objc_msgForward_demo
//
//  Created by Yuen on 16/3/25.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"
#import "Son.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[Son alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
