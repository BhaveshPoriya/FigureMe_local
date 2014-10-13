//
//  MenuContainerVC.m
//  FigureMe
//
//  Created by ECSMac2 on 10/2/14.
//  Copyright (c) 2014 ECS. All rights reserved.
//

#import "MenuContainerVC.h"

@interface MenuContainerVC ()

@end

@implementation MenuContainerVC

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*----------------------------------------------------*/
#pragma mark - Overriden Methods -
/*----------------------------------------------------*/


- (NSString *)segueIdentifierForIndexPathInRightMenu:(NSIndexPath *)indexPath
{
    NSString *identifier = @"";
    switch (indexPath.row) {
        case 0:
            identifier = @"dashboard";
            break;
        case 1:
            identifier = @"profile";
            break;
        case 2:
            identifier = @"notification";
            break;
        case 3:
            identifier = @"stats";
            break;
        case 4:
            identifier = @"bump";
            break;
        case 5:
            identifier = @"logout";
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            [defaults setObject:nil forKey:@"isLoggedIn"];
            [defaults setObject:nil forKey:@"userID"];
            
            [defaults synchronize];
            
            [self performSegueWithIdentifier:@"PushLogOut" sender:Nil];
            
            break;
    }
    return identifier;
}

- (CGFloat)rightMenuWidth
{
    return 180;
}

- (void)configureRightNotificationButton:(UIButton *)button
{
    CGRect frame = button.frame;
    frame = CGRectMake(10, 8, 30, 24);
    button.frame = frame;
    button.backgroundColor = [UIColor clearColor];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(70.0, -150.0, 5.0, 5.0)];
    [button setTitle:[NSString stringWithFormat:@"%d",10] forState:UIControlStateNormal];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [button setImage:[UIImage imageNamed:@"notification"] forState:UIControlStateNormal];
}

- (void)configureRightMenuButton:(UIButton *)button
{
    CGRect frame = button.frame;
    frame = CGRectMake(50, 15, 20, 15);
    button.frame = frame;
    button.backgroundColor = [UIColor clearColor];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [button setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
}



- (void) configureSlideLayer:(CALayer *)layer
{
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = 1;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowRadius = 5;
    layer.masksToBounds = NO;
    layer.shadowPath =[UIBezierPath bezierPathWithRect:self.view.layer.bounds].CGPath;
}

- (AMPrimaryMenu)primaryMenu
{
    return AMPrimaryMenuRight;
}


// Enabling Deepnes on left menu
- (BOOL)deepnessForRightMenu
{
    return YES;
}

// Enabling darkness while right menu is opening
- (CGFloat)maxDarknessWhileRightMenu
{
    return 0.5;
}



@end
