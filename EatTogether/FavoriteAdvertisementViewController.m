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
#import "CustomAdvertisementTableViewCell.h"
#import "Favorite.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface FavoriteAdvertisementViewController()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) id<DataRepository> repository;
@property (nonatomic, strong) NSArray *advertisementsArray;

@end

@implementation FavoriteAdvertisementViewController


#pragma mark - View Life Cycles

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any dditional setup after loading the view.
    
    self.repository = [[NetworkDataRepository alloc]init];
    self.advertisementsArray = [[NSArray alloc]init];
    [self getAllFavorites];
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
}

#pragma mark - Register Cell

-(void) registerCustomCell{
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomAdvertisementTableViewCell" bundle:nil]forCellReuseIdentifier:kCellAdvertisement];
}

#pragma mark - Methods

-(void) getAllFavorites{
    [self.repository getFavoritesAdvertisementWithUsername:@"8SaS7Qj3WD" WithCompletionBlock:^(NSArray *favorites, NSError *error) {
        self.advertisementsArray = favorites;
        [self.tableView reloadData];
    }];
}



#pragma mark - TableView DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.advertisementsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CustomAdvertisementTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellAdvertisement forIndexPath:indexPath];
    //
    
    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 170;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    
//    DetailAdvertisementViewController *detailAdvertisementController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:kStoryboardDetailAdvertisementViewController];
//    detailAdvertisementController.advertisement = self.advertisementsArray[indexPath.row];
//    [self.navigationController pushViewController:detailAdvertisementController animated:YES];
}




@end
