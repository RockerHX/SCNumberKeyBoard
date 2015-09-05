//
//  SCNumberKeyBoard.m
//
//  Created by ShiCang on 15/5/19.
//  Copyright (c) 2015年 ShiCang. All rights reserved.
//

#import "SCNumberKeyBoard.h"

static const CGFloat ZERO_POINT = 0.0f;
static const CGFloat KEY_BOARD_HEIGHT = 180.0f;

typedef void(^BLOCK)(UITextField *textField, NSString *number);

@interface SCNumberKeyBoard () {
    BLOCK           _enterBlock;
    BLOCK           _closeBlock;
    NSMutableArray *_numbers;
    UITextField    *_textField;
}

// Action Methods
- (IBAction)numberButtonPressed:(UIButton *)button;
- (IBAction)coloseButtonPressed;
- (IBAction)backSpaceIconButtonPressed;
- (IBAction)enterButtonPressed;

@end

@implementation SCNumberKeyBoard

#pragma mark - Init Methods
+ (void)showOnViewController:(UIViewController *)viewController
            enterButtonTitle:(NSString *)title
                       enter:(void(^)(UITextField *, NSString *))enter
                       close:(void (^)(UITextField *, NSString *))close
{
    for (UIView *view in viewController.view.subviews) {
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField *)view;
            SCNumberKeyBoard *keyboard = [SCNumberKeyBoard showWithTextField:textField enter:enter close:close];
            [keyboard.enterButton setTitle:(title ?: [keyboard.enterButton titleForState:UIControlStateNormal]) forState:UIControlStateNormal];
        }
    }
}

+ (instancetype)showWithTextField:(UITextField *)textField
                            enter:(void(^)(UITextField *, NSString *))enter
                            close:(void (^)(UITextField *, NSString *))close
{
    return [[SCNumberKeyBoard alloc] initWithTextField:textField enter:enter close:close];
}

- (instancetype)initWithTextField:(UITextField *)textField
                            enter:(void(^)(UITextField *, NSString *))enter
                            close:(void (^)(UITextField *, NSString *))close
{
    // Init keyboard view by xib
    NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:@"SCNumberKeyBoard" withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
    self = [[bundle loadNibNamed:@"SCNumberKeyBoard" owner:self options:nil] firstObject];
    
    _enterBlock = enter;
    _closeBlock = close;
    _textField = textField;
    _textField.inputView = [self keyBoardView];
    _textField.inputAccessoryView = nil;
    [self initConfig];
    
    return self;
}

#pragma mark - Config Methods
- (void)initConfig {
    _numbers = @[].mutableCopy;
}

#pragma mark - Action Methods
- (IBAction)numberButtonPressed:(UIButton *)button {
    // Get input number with keyboard and handle.
    NSString *number = button.currentTitle;
    [self handleNumber:number];
}

- (IBAction)coloseButtonPressed {
    // User determine and close, callback to notifaction coder.
    if (_closeBlock) {
        _closeBlock(_textField, [self outputNumbers]);
    }
    [self dismiss];
}

- (IBAction)backSpaceIconButtonPressed {
    // Delete number
    [_numbers removeLastObject];
    [self outputNumbers];
}

- (IBAction)enterButtonPressed {
    // User determine and close, callback to notifaction coder.
    if (_enterBlock) {
        _enterBlock(_textField, [self outputNumbers]);
    }
    [self dismiss];
}

#pragma mark - Private Methods
- (UIView *)keyBoardView {
    // Layout keyboard for IOS7.
    CGFloat systemVersion = [UIDevice currentDevice].systemVersion.floatValue;
    if ((systemVersion >= 7) && (systemVersion < 8)) {
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        UIView *superview = [[UIView alloc] initWithFrame:CGRectMake(ZERO_POINT, ZERO_POINT, screenWidth, KEY_BOARD_HEIGHT)];
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
    } else {
        return self;
    }
}

- (void)handleNumber:(NSString *)number {
    // Handle decimal point and decimal
    if ([_numbers containsObject:@"."]) {
        if (![number isEqualToString:@"."] && (_numbers.count - [_numbers indexOfObject:@"."]) <= 2) {
            [self pushNumber:number];
        }
    } else {
        [self pushNumber:number];
    }
}

- (void)pushNumber:(NSString *)number {
    // Push a number to container.
    [_numbers addObject:number];
    [self outputNumbers];
}

- (NSString *)outputNumbers {
    // Splice string by numbers on container.
    _enterButton.enabled = _numbers.count;
    NSString *numbers = [_numbers componentsJoinedByString:@""];
    _textField.text = numbers;
    return numbers;
}

#pragma mark - Public Methods
- (void)dismiss {
    [_textField resignFirstResponder];
}

@end
