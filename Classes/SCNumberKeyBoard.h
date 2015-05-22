//
//  SCNumberKeyBoard.h
//  MaintenanceCar
//
//  Created by ShiCang on 15/5/19.
//  Copyright (c) 2015年 MaintenanceCar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCNumberKeyBoard : UIView

@property (weak, nonatomic) IBOutlet UIButton *enterButton;

+ (instancetype)showWithTextField:(UITextField *)textField block:(void(^)(NSString *number))block;
- (instancetype)initWithTextField:(UITextField *)textField block:(void(^)(NSString *number))block;

- (IBAction)numberButtonPressed:(id)sender;
- (IBAction)coloseButtonPressed;
- (IBAction)backSpaceIconButtonPressed;
- (IBAction)enterButtonPressed;

- (void)dismiss;

@end
