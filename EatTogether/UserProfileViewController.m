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
#import "UserProfileAccountViewController.h"

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

    self.usernameField.text = @"";
    self.passwordField.text = @"";
    self.tabBarController.tabBar.hidden = NO;
    
}
- (IBAction)createAccount:(id)sender {
    
    UserCreateAccountViewController *userCreateAccountViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:kStoryboardUserCreateAccountViewController];
    
    [self.navigationController pushViewController:userCreateAccountViewController animated:YES];
    
}

-(void)dismissKeyboard {
    [self.usernameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

- (IBAction)loginButton:(id)sender {
    
    [self.currentSessionManager loginInWithUsername:self.usernameField.text password:self.passwordField.text completionBlock:^(User *user, NSError *error) {
        
        if(!error){
            NSLog(@"Todo ok");
            UserProfileAccountViewController *userProfileAccountViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:kStoryboardUserProfileAccountViewController];
            
            userProfileAccountViewController.user = user;
            
            [self.navigationController pushViewController:userProfileAccountViewController animated:YES];
            
        }else{
            NSLog(@"Problem");
        }
        
    }];
    
}






@end
