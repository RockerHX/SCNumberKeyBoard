//
//  SCNumberKeyBoard.m
//  MaintenanceCar
//
//  Created by ShiCang on 15/5/19.
//  Copyright (c) 2015年 MaintenanceCar. All rights reserved.
//

#import "SCNumberKeyBoard.h"

#define ZERO_POINT          0.0f
#define KEY_BOARD_HEIGHT    180.0f
#define SCREEN_WITH         [UIScreen mainScreen].bounds.size.width

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
    _textField.inputView = [self keyBoardView];
    _textField.inputAccessoryView = nil;
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
#define SYSTEM_VERSION      [UIDevice currentDevice].systemVersion.floatValue
- (UIView *)keyBoardView
{
    if ((SYSTEM_VERSION >= 7) && (SYSTEM_VERSION < 8))
    {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        UIView *superview = [[UIView alloc] initWithFrame:CGRectMake(ZERO_POINT, ZERO_POINT, SCREEN_WITH, KEY_BOARD_HEIGHT)];
        superview.backgroundColor = [UIColor grayColor];
        [superview addSubview:self];
        UIEdgeInsets padding = UIEdgeInsetsMake(ZERO_POINT, ZERO_POINT, ZERO_POINT, ZERO_POINT);
        [superview addConstraints:@[[NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:superview
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:padding.top],
                                    [NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:superview
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1.0
                                                                  constant:padding.left],
                                    [NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:superview
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:-padding.bottom],
                                    [NSLayoutConstraint constraintWithItem:self
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:superview
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1
                                                                  constant:-padding.right],
                                    ]];
        return superview;
    }
    else
        return self;
}

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
