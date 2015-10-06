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
    self = [[[self resourceBundle] loadNibNamed:@"SCNumberKeyBoard" owner:self options:nil] firstObject];
    
    _enterBlock = enter;
    _closeBlock = close;
    _textField = textField;
    _textField.inputView = [self keyBoardView];
    _textField.inputAccessoryView = nil;
    [self initConfig];
    [self viewConfig];
    
    return self;
}

#pragma mark - Config Methods
- (void)initConfig {
    _numbers = @[].mutableCopy;
    
    NSString *text = _textField.text;
    NSInteger length = _textField.text.length;
    if (length) {
        for (NSInteger index = 0; index < length; index ++) {
            [self handleNumber:[text substringWithRange:(NSRange){index, 1}]];
        }
    }
}

static NSString *TextFieldClearButtonImageName = @"ClearButton@2x";
- (void)viewConfig {
    UIButton *clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [clearButton setFrame:CGRectMake(0.0f, 0.0f, 19.0f, 19.0f)];
    NSString *path = [[self resourceBundle] pathForResource:TextFieldClearButtonImageName ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    [clearButton setImage:image forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(clearButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [_textField setValue:clearButton forKey:@"_clearButton"];
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
    BOOL canContinue = [self performShouldChangeCharactersDelegateMethodInRange:(NSRange){_numbers.count - 1, 1} replacementString:[_numbers lastObject]];
    if (canContinue) {
        [_numbers removeLastObject];
        [self outputNumbers];
    }
}

- (IBAction)enterButtonPressed {
    // User determine and close, callback to notifaction coder.
    if (_enterBlock) {
        _enterBlock(_textField, [self outputNumbers]);
    }
    [self dismiss];
}

- (void)clearButtonPressed {
    // Delete all number
    BOOL canContinue = [self performShouldChangeCharactersDelegateMethodInRange:(NSRange){0, _numbers.count} replacementString:[self outputNumbers]];
    if (canContinue) {
        if ([self performTextFieldShouldClear]) {
            [_numbers removeAllObjects];
            [self outputNumbers];
        }
    }
}

#pragma mark - Private Methods
static NSString *NumberKeyBoardResourceBundleName = @"SCNumberKeyBoard";
- (NSBundle *)resourceBundle {
    NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:NumberKeyBoardResourceBundleName withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
    return bundle;
}

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
    BOOL canContinue =  [self performShouldChangeCharactersDelegateMethodInRange:(NSRange){_numbers.count, 0} replacementString:number];
    if (canContinue) {
        NSString *firstNumber = [_numbers firstObject];
        if ([firstNumber isEqualToString:@"0"]) {
            if (([number isEqualToString:@"."]) || (_numbers.count >= 2)) {
                [self addNumber:number];
            }
        } else {
            [self addNumber:number];
        }
    }
}

- (void)addNumber:(NSString *)number {
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

- (BOOL)performShouldChangeCharactersDelegateMethodInRange:(NSRange)range replacementString:(NSString *)string {
    if ([_textField.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [_textField.delegate textField:_textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}

- (BOOL)performTextFieldShouldClear {
    if ([_textField.delegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [_textField.delegate textFieldShouldClear:_textField];
    }
    return YES;
}

#pragma mark - Public Methods
- (void)dismiss {
    [_textField resignFirstResponder];
    if ([_textField.delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        [_textField.delegate textFieldShouldReturn:_textField];
    }
}

@end
