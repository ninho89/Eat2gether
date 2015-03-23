//
//  UserLogInController.m
//  EatTogether
//
//  Created by Filippo Aresu on 23/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "UserLogInController.h"
#import "CurrentSessionManager.h"

@interface UserLogInController ()
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;

@property (nonatomic, strong) CurrentSessionManager *currentSessionManager;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@end

@implementation UserLogInController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.currentSessionManager = [[CurrentSessionManager alloc]init];
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:self.tapGesture];
    
}

-(void)dismissKeyboard {
    [self.usernameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

- (IBAction)loginButton:(id)sender {
    
    [self.currentSessionManager loginInWithUsername:self.usernameField.text password:self.passwordField.text completionBlock:^(User *user, NSError *error) {
        
    }];
    
}

@end
