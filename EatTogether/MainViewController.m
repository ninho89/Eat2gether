//
//  ViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 17/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "MainViewController.h"
#import "NetworkDataRepository.h"
#import "City.h"
#import "CustomCityTableViewCell.h"
#import "DetailCityListAdvertisementViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MainViewController ()

@property (nonatomic, strong) id<DataRepository> repository;
@property (nonatomic, strong) NSArray *citiesArray;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

#pragma mark - View Life Cycles

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupRefreshController];
    self.repository = [[NetworkDataRepository alloc]init];
    self.citiesArray = [[NSArray alloc]init];
    [self.activityIndicator startAnimating];
    [self getAllCities:nil];
    [self registerCustomCell];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationItem.title=@"Eat2gether";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{
                              NSForegroundColorAttributeName : [UIColor flatPumpkinColor]/*[UIColor colorWithRed:0 green:0.478 blue:1 alpha:1]*/,
                              NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:24.0]
                              }];
    //self.tabBarController.tabBar.tintColor = [UIColor redColor];
    self.tabBarController.tabBar.tintColor = [UIColor flatPumpkinColor];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Eat2gether";
}

#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Register Cell

-(void) registerCustomCell{
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCityTableViewCell" bundle:nil]forCellReuseIdentifier:kCellCity];
}

#pragma mark - Methods

-(void) setupRefreshController{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    [refreshControl addTarget:self
                       action:@selector(refresh:)
             forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    self.tableView.alwaysBounceVertical = YES;
}

-(void) refresh:(id)sender{
    [self getAllCities:sender];
}

-(void) getAllCities:(id)sender{
    [self.repository getCitiesWithCompletionBlock:^(NSArray *cities, NSError *error) {
        self.citiesArray = cities;
        [self.tableView reloadData];
        [self.activityIndicator stopAnimating];
        if(sender){
            [(UIRefreshControl *)sender endRefreshing];
        }
    }];
}

#pragma mark - TableView DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.citiesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CustomCityTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellCity forIndexPath:indexPath];
  
    City *city = self.citiesArray[indexPath.row];

//    [cell.cityPictureImage sd_setImageWithURL:[NSURL URLWithString:city.cityPicture] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
//    }];
    
    [cell.cityPictureImage sd_setImageWithURL:[NSURL URLWithString:city.cityPictureUrl]
                             placeholderImage:nil];

    cell.cityNameLabel.text = city.cityName;
    
 
    return cell;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    
    DetailCityListAdvertisementViewController *detailCityListViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:kStoryboardDetailCityListAdvertisementViewController];
    detailCityListViewController.city = self.citiesArray[indexPath.row];
    
    [self.navigationController pushViewController:detailCityListViewController animated:YES];
    
}

 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 
     return 160;
 }
 

@end
