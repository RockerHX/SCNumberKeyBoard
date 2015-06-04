//
//  SCNumberKeyBoard.h
//
//  Created by ShiCang on 15/5/19.
//  Copyright (c) 2015年 ShiCang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCNumberKeyBoard : UIView

@property (weak, nonatomic) IBOutlet UIButton *enterButton;

/**
 *  Class Method : show number keyboard for all text field on view controller.
 *  类方法：为某一个视图控制器的所有text field控件添加数字键盘。
 */
+ (void)showOnViewController:(UIViewController *)viewController
                       block:(void(^)(UITextField *textField, NSString *number))block;

/**
 *  Class Method : show number keyboard for a text field.
 *  类方法：为某一个text field控件添加数字键盘。
 */
+ (instancetype)showWithTextField:(UITextField *)textField
                            block:(void(^)(UITextField *textField, NSString *number))block;

/**
 *  Intance Method : show number keyboard for a text field.
 *  实例方法：为某一个text field控件添加数字键盘。
 */
- (instancetype)initWithTextField:(UITextField *)textField
                            block:(void(^)(UITextField *textField, NSString *number))block;

// Action Methods
- (IBAction)numberButtonPressed:(id)sender;
- (IBAction)coloseButtonPressed;
- (IBAction)backSpaceIconButtonPressed;
- (IBAction)enterButtonPressed;

/**
 *  Close Keyboard
 */
- (void)dismiss;

@end
