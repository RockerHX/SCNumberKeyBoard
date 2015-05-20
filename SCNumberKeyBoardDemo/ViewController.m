//
//  ViewController.m
//  SCNumberKeyBoardDemo
//
//  Created by ShiCang on 15/5/20.
//  Copyright (c) 2015年 SCLibrary. All rights reserved.
//

#import "ViewController.h"
#import "SCNumberKeyBoard.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [SCNumberKeyBoard showWithTextField:_textField];
}

@end
