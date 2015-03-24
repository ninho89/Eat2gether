//
//  FavoriteAdvertisementViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 23/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "FavoriteAdvertisementViewController.h"
#import "DataRepository.h"
#import "NetworkDataRepository.h"
#import "CustomFavoriteTableViewCell.h"
#import "Favorite.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "CurrentSessionManager.h"
#import "User.h"
#import "DetailAdvertisementViewController.h"

@interface FavoriteAdvertisementViewController()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) id<DataRepository> repository;
@property (nonatomic, strong) NSMutableArray *favoritesArray;
@property (nonatomic, strong) CurrentSessionManager *currentSessionManager;

@end

@implementation FavoriteAdvertisementViewController


#pragma mark - View Life Cycles

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any dditional setup after loading the view.
    
    self.currentSessionManager = [CurrentSessionManager sharedInstance];
    
    self.repository = [[NetworkDataRepository alloc]init];
    self.favoritesArray = [[NSMutableArray alloc]init];
    
    [self registerCustomCell];
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = @"Favoritos";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{
                              NSForegroundColorAttributeName :[UIColor colorWithRed:0 green:0.478 blue:1 alpha:1],
                              NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:24.0]
                              }];
    
    if([self.currentSessionManager isLoggedIn]){
        [self getAllFavorites];
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Tienes que loguearte para ver tus favoritos" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

#pragma mark - Register Cell

-(void) registerCustomCell{
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomFavoriteTableViewCell" bundle:nil]forCellReuseIdentifier:kCellAdvertisement];
}

#pragma mark - Methods

-(void) getAllFavorites{
    [self.repository getFavoritesAdvertisementWithUsername:self.currentSessionManager.currentUser.userObjectId WithCompletionBlock:^(NSArray *favorites, NSError *error) {
        self.favoritesArray = [favorites mutableCopy];
        [self.tableView reloadData];
        if(favorites.count == 0){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Vaya!" message:@"No tienes ningun favorito guardado" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }];
    
}

#pragma mark - TableView DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.favoritesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomFavoriteTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellAdvertisement forIndexPath:indexPath];
    
    Favorite *favorite = self.favoritesArray[indexPath.row];
    
    [cell.customDetailImage sd_setImageWithURL:[NSURL URLWithString:favorite.favoriteDetailAdvertisementPictureUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    
//    [cell.customUserImage sd_setImageWithURL:[NSURL URLWithString:favorite.favoriteUserPicture] placeholderImage:nil];
    
    cell.customLabelPrice.text = [NSString stringWithFormat:@"%@ €", favorite.favoriteDetailAdvertisementPrice];
    
    cell.customLabelStarter.text = favorite.favoriteDetailAdvertisementStarter;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 170;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
     
        [self.favoritesArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [tableView reloadData];
        
        //query to delete favorite
    
    }else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



@end
