//
//  LoginViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 22/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "UserProfileViewController.h"
#import "UserCreateAccountViewController.h"
#import "UserLogInController.h"

@interface UserProfileViewController ()


@end

@implementation UserProfileViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (IBAction)createAccount:(id)sender {
    
    UserCreateAccountViewController *userCreateAccountViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:kStoryboardUserCreateAccountViewController];
    
    [self.navigationController pushViewController:userCreateAccountViewController animated:YES];
    
}

- (IBAction)startSession:(id)sender {
//    UserCreateAccountViewController *userCreateAccountViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:kStoryboardUserCreateAccountViewController];
//    
//    [self.navigationController pushViewController:userCreateAccountViewController animated:YES];
    
    UserLogInController *userLoginController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:kStoryboardUserLoginViewController];
    
    [self.navigationController pushViewController:userLoginController animated:YES];
}





@end
