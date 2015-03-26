//
//  UserProfileAccountViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 24/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "UserProfileAccountViewController.h"
#import "CurrentSessionManager.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UserProfileAccountAdvertisementsViewController.h"
#import "UserProfileAccountRequestViewController.h"
#import "UserProfileAccountRequestRecieveViewController.h"

@interface UserProfileAccountViewController () <UITabBarControllerDelegate>

@property (nonatomic, strong) CurrentSessionManager *currentSessionManager;
@property (weak, nonatomic) IBOutlet UIImageView *imageUser;

@end

@implementation UserProfileAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.navigationItem setHidesBackButton:YES animated:YES];
    
    
    
    self.currentSessionManager = [CurrentSessionManager sharedInstance];
    NSLog(@"Profile UseNamer: %@", self.currentSessionManager.currentUser.username);
    NSLog(@"Profile UserObjectId: %@", self.currentSessionManager.currentUser.userObjectId);
    self.navigationItem.title = @"Perfil";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{
                              NSForegroundColorAttributeName:[UIColor flatPumpkinColor]/*colorWithRed:0 green:0.478 blue:1 alpha:1]*/,
                              NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:24.0]
                              }];
    
    
    UIButton *setting = [UIButton buttonWithType:UIButtonTypeCustom];
    [setting setFrame:CGRectMake(0.0f, 0.0f, 30.0f, 30.0f)];
    [setting addTarget:self action:@selector(showUserSettings) forControlEvents:UIControlEventTouchUpInside];
    [setting setImage:[UIImage imageNamed:@"settings1"] forState:UIControlStateNormal];
    UIBarButtonItem *barButtonSetting = [[UIBarButtonItem alloc] initWithCustomView:setting];
    self.navigationItem.leftBarButtonItem = barButtonSetting;
    
    
    UIButton *logout = [UIButton buttonWithType:UIButtonTypeCustom];
    [logout setFrame:CGRectMake(0.0f, 0.0f, 30.0f, 25.0f)];
    [logout addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [logout setImage:[UIImage imageNamed:@"logout2"] forState:UIControlStateNormal];
    UIBarButtonItem *barButtonLogout = [[UIBarButtonItem alloc] initWithCustomView:logout];
    self.navigationItem.rightBarButtonItem = barButtonLogout;

    //[self.imageUser sd_setImageWithURL:[NSURL URLWithString:self.user.userPicture]];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //self.tabBarController.tabBar.hidden = YES;
    self.imageUser.clipsToBounds = YES;
    self.imageUser.layer.cornerRadius = self.imageUser.bounds.size.height / 2.0f;
    self.tabBarController.tabBar.hidden = NO;
    [self.imageUser sd_setImageWithURL:[NSURL URLWithString:self.user.userPicture]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
}


-(void) logout{
    [self.currentSessionManager logoutWithCompletionBlock:^(User *user, NSError *error) {
        if(!error){
            NSLog(@"Logout");
            
        }else{
            NSLog(@"Problem");
        }

    }];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) showUserSettings{
    
}


- (IBAction)requestPending:(id)sender {
    UserProfileAccountRequestViewController *userProfileAccountRequestViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:kStoryboardUserProfileAccountAdvertisementRequestViewController];
    [self.navigationController pushViewController:userProfileAccountRequestViewController animated:YES];
}

- (IBAction)requesReceived:(id)sender {
    UserProfileAccountRequestRecieveViewController *userProfileAccountRequestRecieveViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:kStoryboardUserProfileAccountAdvertisementRequestRecieveViewController];
    [self.navigationController pushViewController:userProfileAccountRequestRecieveViewController animated:YES];
    
}

- (IBAction)myAdvertisements:(id)sender {
    UserProfileAccountAdvertisementsViewController *userProfileAccountAdvertisementsViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:kStoryboardUserProfileAccountAdvertisementsViewController];
    [self.navigationController pushViewController:userProfileAccountAdvertisementsViewController animated:YES];
}


@end
