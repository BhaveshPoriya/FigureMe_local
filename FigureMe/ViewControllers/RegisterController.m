//
//  RegisterController.m
//  FigureMe
//
//  Created by ECSMac2 on 10/2/14.
//  Copyright (c) 2014 ECS. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController ()

@end

@implementation RegisterController

#pragma mark - Properties

@synthesize scrollView = _scrollView;

@synthesize txtUsername = _txtUsername,
txtEmail = _txtEmail,
txtPassword = _txtPassword,
txtRepeatPassword = _txtRepeatPassword;


#pragma mark - View Lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.scrollView contentSizeToFit];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Control Delegates

- (IBAction)btnCancelClicked:(id)sender {
     [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)btnRegisterClicked:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - UITextField Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
