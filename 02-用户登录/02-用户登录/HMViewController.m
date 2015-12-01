//
//  HMViewController.m
//  02-用户登录
//
//  Created by apple on 14-8-18.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "HMViewController.h"

@interface HMViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;

@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.userNameText becomeFirstResponder];
}

- (IBAction)login
{
    NSLog(@"%s %@ %@", __func__, self.userNameText.text, self.pwdText.text);
}



#pragma mark 文本框代理方法
// 在文本框中按回车的处理
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@", textField);
    // 如果光标在用户名，切换到密码
    if (textField == self.userNameText) {
        // 密码成为第一响应者
        [self.pwdText becomeFirstResponder];
    } else if (textField == self.pwdText) {
        // 输入焦点就在密码框中
        // 如果是密码，直接调用登录方法
        [self login];
        
        // 关闭键盘
//        [self.view endEditing:YES];
        // 让密码文本框关闭键盘
//        [textField resignFirstResponder];
        [self.pwdText resignFirstResponder];
    }
    
    return YES;
}


@end
