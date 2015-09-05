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
            enterButtonTitle:(NSString *)title
                       enter:(void(^)(UITextField *textField, NSString *number))enter
                       close:(void(^)(UITextField *textField, NSString *number))close;

/**
 *  Class Method : show number keyboard for a text field.
 *  类方法：为某一个text field控件添加数字键盘。
 */
+ (instancetype)showWithTextField:(UITextField *)textField
                            enter:(void(^)(UITextField *textField, NSString *number))enter
                            close:(void(^)(UITextField *textField, NSString *number))close;

/**
 *  Intance Method : show number keyboard for a text field.
 *  实例方法：为某一个text field控件添加数字键盘。
 */
- (instancetype)initWithTextField:(UITextField *)textField
                            enter:(void(^)(UITextField *textField, NSString *number))enter
                            close:(void(^)(UITextField *textField, NSString *number))close;

/**
 *  Close Keyboard
 */
- (void)dismiss;

@end
