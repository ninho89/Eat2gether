//
//  UserCreateAccountViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 22/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "UserCreateAccountViewController.h"
#import "CurrentSessionManager.h"
#import "UserProfileAccountViewController.h"

@interface UserCreateAccountViewController ()

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *rePasswordField;
@property (nonatomic, strong) CurrentSessionManager *currentSessionManager;

@end

@implementation UserCreateAccountViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.currentSessionManager = [CurrentSessionManager sharedInstance];
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:self.tapGesture];
    
}

-(void)dismissKeyboard {
    [self.usernameField resignFirstResponder];
    [self.emailField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    [self.rePasswordField resignFirstResponder];
}

- (IBAction)createUser:(id)sender {
    [self checkFieldsComplete];
}


- (void) checkFieldsComplete {
    if ([_usernameField.text isEqualToString:@""] || [_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_rePasswordField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oooopss!" message:@"Tienes que rellenar todos los campos" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self checkPasswordsMatch];
    }
}

- (void) checkPasswordsMatch {
    if (![_passwordField.text isEqualToString:_rePasswordField.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oooopss!" message:@"Passwords no son iguales" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self registerNewUser];
    }
}

- (void) registerNewUser {
    NSLog(@"registering....");
    [self.currentSessionManager registerWithUsername:self.usernameField.text password:self.passwordField.text email:self.emailField.text completionBlock:^(User *user, NSError *error) {
        
        if(!error){
            NSLog(@"usuario registrado ok");
            
            UserProfileAccountViewController *userProfileAccountViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:kStoryboardUserProfileAccountViewController];
            
            userProfileAccountViewController.user = user;
            
            [self.navigationController pushViewController:userProfileAccountViewController animated:YES];
            
        }else{
            NSLog(@"problema usuario registrado");
        }

        
    }];
    
}





@end
