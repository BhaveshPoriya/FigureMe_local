//
//  LoginController.m
//  FigureMe
//
//  Created by ECSMac2 on 10/2/14.
//  Copyright (c) 2014 ECS. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()

@end

@implementation LoginController

#pragma mark - Properties
@synthesize txtUsername = _txtUsername,
txtPassword = _txtPassword;


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
    self.navigationController.navigationBarHidden = YES;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}

#pragma mark - Control Delegates

- (IBAction)btnRegisterClicked:(id)sender
{
    [self performSegueWithIdentifier:@"PushLoginToRegister" sender:Nil];
}

- (IBAction)btnLoginClicked:(id)sender
{
    if(![self.txtUsername.text isEqualToString:@""] && ![self.txtPassword.text isEqualToString:@""])
    {
        [self addOverLay];
        NSOperationQueue *queue = [NSOperationQueue new];
        NSInvocationOperation *operation = [[NSInvocationOperation alloc]
                                        initWithTarget:self
                                        selector:@selector(processLogInRequest)
                                        object:Nil];
        [queue addOperation:operation];
    }
    else
    {
        NSLog(@"Username or password is required");
    }
}


#pragma mark - API Processes

- (void) processLogInRequest
{
    NSString *username = self.txtUsername.text;
    NSString *password = self.txtPassword.text;
    
    NSMutableURLRequest *_request = [CommanFunctions getLogInRequest:username Password:password];
    _request.timeoutInterval = 30;
    
    [NSURLConnection sendAsynchronousRequest:_request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
             [self performSelectorOnMainThread:@selector(handleAPIResponse:) withObject:greeting waitUntilDone:NO];
         }
         else
         {
             [self removeOverLay];
         }
     }];

}

- (void) handleAPIResponse:(NSDictionary *)data
{
    NSString *status = [data objectForKey:@"status"];
    if([status isEqualToString:@"success"])
    {
        NSUserDefaults *_defaults = [NSUserDefaults standardUserDefaults];
        [_defaults setBool:YES forKey:@"isLoggedIn"];
        [_defaults synchronize];
        [self performSegueWithIdentifier:@"PushLoginToDashboard" sender:Nil];
    }
    else
    {
        NSLog(@"Username or password is invalid");
        [self removeOverLay];
    }
}


#pragma mark - Custom Delegates

- (void)addOverLay
{
    self.spinnerOverlay = [[UIView alloc] initWithFrame:self.view.frame];
    self.spinnerOverlay.backgroundColor = [UIColor blackColor];
    self.spinnerOverlay.alpha = 0.50f;
    
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.spinner setCenter:CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0)];
    [self.spinnerOverlay addSubview:self.spinner];
    [self.spinner startAnimating];
    
    [self.view addSubview:self.spinnerOverlay];
    [self.view bringSubviewToFront:self.spinnerOverlay];
}

- (void)removeOverLay
{
    [self.spinner stopAnimating];
    [self.spinnerOverlay removeFromSuperview];
}

#pragma mark - UITextField Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
