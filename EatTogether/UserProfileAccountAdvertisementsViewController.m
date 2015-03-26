//
//  UserProfileAccountAdvertisementsViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 24/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "UserProfileAccountAdvertisementsViewController.h"
#import "UserProfileAccountAddAdvertisementsViewController.h"
#import "NetworkDataRepository.h"
#import "Advertisement.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "CurrentSessionManager.h"
#import "User.h"
#import "CustomFavoriteTableViewCell.h"

@interface UserProfileAccountAdvertisementsViewController ()

@property (nonatomic, strong) id<DataRepository> repository;
@property (nonatomic, strong) CurrentSessionManager *currentSessionManager;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *advertisementsArray;

@end

@implementation UserProfileAccountAdvertisementsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.currentSessionManager = [CurrentSessionManager sharedInstance];
    self.repository = [[NetworkDataRepository alloc]init];
    self.advertisementsArray = [[NSArray alloc]init];
    [self registerCustomCell];
    [self getUserAdvertisements];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = @"Mis anuncios";
    UIBarButtonItem *barButtonAdd = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAdvertisement)];
    self.navigationItem.rightBarButtonItem = barButtonAdd;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) registerCustomCell{
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomFavoriteTableViewCell" bundle:nil]forCellReuseIdentifier:kCellAdvertisement];
}

-(void) getUserAdvertisements{
    [self.repository getAdvertisementWithUserObjectId:self.currentSessionManager.currentUser.userObjectId WithCompletionBlock:^(NSArray *advertisement, NSError *error) {
        self.advertisementsArray = advertisement;
        [self.tableView reloadData];
    }];
}

-(void) addAdvertisement{    
    UserProfileAccountAddAdvertisementsViewController *userProfileAccountAddAdvertisementsViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:kStoryboardUserProfileAccountAddAdvertisementsViewController];
    
    [self.navigationController pushViewController:userProfileAccountAddAdvertisementsViewController animated:YES];
}

#pragma mark - TableView DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.advertisementsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomFavoriteTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellAdvertisement forIndexPath:indexPath];
    
    Advertisement *advertisement = self.advertisementsArray[indexPath.row];
    
    [cell.customDetailImage sd_setImageWithURL:[NSURL URLWithString:advertisement.advertisementPictureUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    
    cell.customLabelPrice.text = [NSString stringWithFormat:@"%@€", advertisement.advertisementPrice];
    
    cell.customLabelStarter.text = advertisement.advertisementStarter;
    
    return cell;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 170;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    
}


@end
