//
//  SCNumberKeyBoard.m
//  MaintenanceCar
//
//  Created by ShiCang on 15/5/19.
//  Copyright (c) 2015年 MaintenanceCar. All rights reserved.
//

#import "SCNumberKeyBoard.h"

@implementation SCNumberKeyBoard
{
    NSMutableArray *_numbers;
    UITextField    *_textField;
}

#pragma mark - Init Methods
+ (instancetype)showWithTextField:(UITextField *)textField
{
    return [[SCNumberKeyBoard alloc] initWithTextField:textField];
}

- (instancetype)initWithTextField:(UITextField *)textField
{
    // 从Xib加载View
    self = [[[NSBundle mainBundle] loadNibNamed:@"SCNumberKeyBoard" owner:self options:nil] firstObject];
    
    _textField = textField;
    _textField.inputView = self;
    [self initConfig];
    
    return self;
}

#pragma mark - Config Methods
- (void)initConfig
{
    _numbers = @[].mutableCopy;
}

#pragma mark - Action Methods
- (IBAction)numberButtonPressed:(id)sender
{
    NSString *number = ((UIButton *)sender).currentTitle;
    if ([_numbers containsObject:@"."])
    {
        if (![number isEqualToString:@"."] && (_numbers.count - [_numbers indexOfObject:@"."]) <= 2)
            [self pushNumber:number];
    }
    else
        [self pushNumber:number];
}

- (IBAction)coloseButtonPressed
{
    [self dismiss];
}

- (IBAction)backSpaceIconButtonPressed
{
    [_numbers removeLastObject];
    [self outputNumbers];
}

- (IBAction)enterButtonPressed
{
    [self outputNumbers];
    [self dismiss];
}

#pragma mark - Private Methods
- (void)pushNumber:(NSString *)number
{
    [_numbers addObject:number];
    [self outputNumbers];
}

- (void)outputNumbers
{
    NSString *numbers = [_numbers componentsJoinedByString:@""];
    _textField.text = numbers;
    _enterButton.enabled = _numbers.count;
}

#pragma mark - Public Methods
- (void)dismiss
{
    [_textField resignFirstResponder];
}

@end
