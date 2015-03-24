//
//  LoginViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 22/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "UserProfileViewController.h"
#import "UserCreateAccountViewController.h"
#import "CurrentSessionManager.h"

@interface UserProfileViewController ()

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (nonatomic, strong) CurrentSessionManager *currentSessionManager;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;


@end

@implementation UserProfileViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.currentSessionManager = [CurrentSessionManager sharedInstance];
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:self.tapGesture];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (IBAction)createAccount:(id)sender {
    
    UserCreateAccountViewController *userCreateAccountViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:kStoryboardUserCreateAccountViewController];
    
    [self.navigationController pushViewController:userCreateAccountViewController animated:YES];
    
}

//- (IBAction)startSession:(id)sender {
////    UserCreateAccountViewController *userCreateAccountViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:kStoryboardUserCreateAccountViewController];
////    
////    [self.navigationController pushViewController:userCreateAccountViewController animated:YES];
//    
//    UserLogInController *userLoginController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:kStoryboardUserLoginViewController];
//    
//    [self.navigationController pushViewController:userLoginController animated:YES];
//}


-(void)dismissKeyboard {
    [self.usernameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

- (IBAction)loginButton:(id)sender {

    [self.currentSessionManager loginInWithUsername:self.usernameField.text password:self.passwordField.text completionBlock:^(User *user, NSError *error) {
        
    }];
    
}






@end
