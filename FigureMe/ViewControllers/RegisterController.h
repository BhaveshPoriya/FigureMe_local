//
//  RegisterController.h
//  FigureMe
//
//  Created by ECSMac2 on 10/2/14.
//  Copyright (c) 2014 ECS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"

@interface RegisterController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnRegister;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;

- (IBAction)btnRegisterClicked:(id)sender;
- (IBAction)btnCancelClicked:(id)sender;

@end
