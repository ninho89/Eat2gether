//
//  UserProfileAccountViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 24/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "UserProfileAccountViewController.h"
#import "CurrentSessionManager.h"

@interface UserProfileAccountViewController ()

@property (nonatomic, strong) CurrentSessionManager *currentSessionManager;

@end

@implementation UserProfileAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.navigationItem setHidesBackButton:YES animated:YES];
    
    self.currentSessionManager = [CurrentSessionManager sharedInstance];
    
    self.navigationItem.title = @"Perfil";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{
                              NSForegroundColorAttributeName :[UIColor colorWithRed:0 green:0.478 blue:1 alpha:1],
                              NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:24.0]
                              }];
    
    
    UIButton *setting = [UIButton buttonWithType:UIButtonTypeCustom];
    [setting setFrame:CGRectMake(0.0f, 0.0f, 30.0f, 30.0f)];
    [setting addTarget:self action:@selector(showUserSettings) forControlEvents:UIControlEventTouchUpInside];
    [setting setImage:[UIImage imageNamed:@"settings"] forState:UIControlStateNormal];
    UIBarButtonItem *barButtonSetting = [[UIBarButtonItem alloc] initWithCustomView:setting];
    self.navigationItem.leftBarButtonItem = barButtonSetting;
    
    
    UIButton *logout = [UIButton buttonWithType:UIButtonTypeCustom];
    [logout setFrame:CGRectMake(0.0f, 0.0f, 30.0f, 30.0f)];
    [logout addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [logout setImage:[UIImage imageNamed:@"logout"] forState:UIControlStateNormal];
    UIBarButtonItem *barButtonLogout = [[UIBarButtonItem alloc] initWithCustomView:logout];
    self.navigationItem.rightBarButtonItem = barButtonLogout;


}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //self.tabBarController.tabBar.hidden = YES;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
