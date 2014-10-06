//
//  LoginController.h
//  FigureMe
//
//  Created by ECSMac2 on 10/2/14.
//  Copyright (c) 2014 ECS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"


@interface LoginController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnRegister;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;


@property (strong, nonatomic) IBOutlet UIView *spinnerOverlay;
@property (strong, nonatomic) UIActivityIndicatorView *spinner;


- (IBAction)btnRegisterClicked:(id)sender;
- (IBAction)btnLoginClicked:(id)sender;

@end
