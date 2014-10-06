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
    
    UITextField *theTextFiels=[[UITextField alloc]initWithFrame:CGRectMake(26, 250, 250, 41)];
    theTextFiels.borderStyle=UITextBorderStyleRoundedRect;
    [theTextFiels setText:@"Username"];
    [theTextFiels setFont:[UIFont systemFontOfSize:18]];
    [theTextFiels setTextColor:[UIColor whiteColor]];
    theTextFiels.layer.cornerRadius=8.0f;
    theTextFiels.layer.masksToBounds=YES;
    theTextFiels.backgroundColor=[UIColor blueColor];
    theTextFiels.layer.borderColor=[[UIColor blackColor]CGColor];
    //theTextFiels.layer.borderWidth= 1.0f;
    [self.view addSubview:theTextFiels];
    
    
    
    
    
    
    
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

- (IBAction)btnRegisterClicked:(id)sender {
    [self performSegueWithIdentifier:@"PushLoginToRegister" sender:Nil];
}

- (IBAction)btnLoginClicked:(id)sender{
    
    NSString *username = @"";
    NSString *password = @"";
    
    username = @"Nimisha Patel";
    password = @"nimisha123";
    
    NSMutableDictionary *reqDist = [[NSMutableDictionary alloc] init];
    [reqDist setObject:@"login" forKey:@"action"];
    [reqDist setObject:username forKey:@"username"];
    [reqDist setObject:password forKey:@"password"];
    
    NSString *_url= @"http://www.ecsprojects.com/figureme/api/login";
    
    NSMutableURLRequest *_request = [CommanFunctions generateAPIRequest:_url reqDist:reqDist];

    [NSURLConnection sendAsynchronousRequest:_request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
             NSString *status = [greeting objectForKey:@"status"];
             if([status isEqualToString:@"success"])
             {
                [self performSegueWithIdentifier:@"PushLoginToDashboard" sender:Nil];
             }
             else
             {
                 NSLog(@"Username or password is invalid");
             }
         }
     }];
    
}

@end
