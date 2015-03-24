//
//  UserProfileAccountAdvertisementsViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 24/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "UserProfileAccountAdvertisementsViewController.h"

@interface UserProfileAccountAdvertisementsViewController ()

@end

@implementation UserProfileAccountAdvertisementsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = @"Mis anuncios";
    UIBarButtonItem *barButtonAdd = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAdvertisement)];
    self.navigationItem.rightBarButtonItem = barButtonAdd;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) addAdvertisement{
    
}

@end
