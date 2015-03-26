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
#import <MobileCoreServices/MobileCoreServices.h>

@interface UserCreateAccountViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *rePasswordField;
@property (nonatomic, strong) CurrentSessionManager *currentSessionManager;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic) BOOL newMedia;

@end

@implementation UserCreateAccountViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.currentSessionManager = [CurrentSessionManager sharedInstance];
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:self.tapGesture];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.tintColor = [UIColor flatPumpkinColor];
}

-(void)dismissKeyboard {
    [self.usernameField resignFirstResponder];
    [self.emailField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    [self.rePasswordField resignFirstResponder];
}

- (IBAction)createUser:(id)sender {
    [self dismissKeyboard];
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
- (IBAction)takePhoto:(id)sender {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        self.newMedia = YES;
        [self presentViewController:imagePicker animated:YES completion:nil];

    }
}

#pragma mark - Camera delegates
//
//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
//    NSString *mediaType = info[UIImagePickerControllerMediaType];
//    [self dismissViewControllerAnimated:YES completion:nil];
//    
//    }
//}

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
