//
//  SCNumberKeyBoard.m
//  MaintenanceCar
//
//  Created by ShiCang on 15/5/19.
//  Copyright (c) 2015年 MaintenanceCar. All rights reserved.
//

#import "SCNumberKeyBoard.h"

typedef void(^BLOCK)(NSString *number);

@implementation SCNumberKeyBoard
{
    BLOCK           _block;
    NSMutableArray *_numbers;
    UITextField    *_textField;
}

#pragma mark - Init Methods
+ (instancetype)showWithTextField:(UITextField *)textField block:(void(^)(NSString *number))block
{
    return [[SCNumberKeyBoard alloc] initWithTextField:textField block:block];
}

- (instancetype)initWithTextField:(UITextField *)textField block:(void(^)(NSString *number))block
{
    // 从Xib加载View
    NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:@"SCNumberKeyBoard" withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
    self = [[bundle loadNibNamed:@"SCNumberKeyBoard" owner:self options:nil] firstObject];
    
    _block = block;
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
    
    if (_block)
        _block(_textField.text);
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
