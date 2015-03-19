//
//  DetailCityListViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 18/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "DetailCityListAdvertisementViewController.h"
#import "NetworkDataRepository.h"
#import "CustomAdvertisementTableViewCell.h"
#import "Advertisement.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "MapCityListAdvertisementViewController.h"

@interface DetailCityListAdvertisementViewController ()

@property (nonatomic, strong) id<DataRepository> repository;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *advertisementsArray;


@end

@implementation DetailCityListAdvertisementViewController

#pragma mark - View Life Cycles

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any dditional setup after loading the view.
    
    self.repository = [[NetworkDataRepository alloc]init];
    self.advertisementsArray = [[NSArray alloc]init];
    [self getAllAdvertisements];
    [self drawPinMapImage];
    [self registerCustomCell];
    

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"Back";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    
    self.navigationItem.title = self.city.cityName;
    [self.navigationController.navigationBar
    setTitleTextAttributes:@{
                              NSForegroundColorAttributeName :[UIColor colorWithRed:0 green:0.478 blue:1 alpha:1],
                              NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:24.0]
                              }];
}

#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Register Cell

-(void) registerCustomCell{
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomAdvertisementTableViewCell" bundle:nil]forCellReuseIdentifier:kCellAdvertisement];
}

#pragma mark - Methods

-(void) getAllAdvertisements{
    [self.repository getCitiesAdvertisementWithSCity:self.city.cityObjectId WithCompletionBlock:^(NSArray *advertisement, NSError *error) {
        self.advertisementsArray = advertisement;
        [self.tableView reloadData];
    }];
}

-(void) drawPinMapImage{
    UIButton *imagePin = [UIButton buttonWithType:UIButtonTypeCustom];
    [imagePin setFrame:CGRectMake(0.0f, 0.0f, 20.0f, 30.0f)];
    [imagePin addTarget:self action:@selector(showAdvertisementsMap) forControlEvents:UIControlEventTouchUpInside];
    [imagePin setImage:[UIImage imageNamed:@"pinMap"] forState:UIControlStateNormal];
    UIBarButtonItem *barButtonPinMap = [[UIBarButtonItem alloc] initWithCustomView:imagePin];
    self.navigationItem.rightBarButtonItem = barButtonPinMap;
}

-(void) showAdvertisementsMap{
    MapCityListAdvertisementViewController *mapCityListAdvertisement = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:kStoryboardMapCityListAdvertisementViewController];
    [self.navigationController pushViewController:mapCityListAdvertisement animated:YES];
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
    Advertisement *advertisement = self.advertisementsArray[indexPath.row];
//    

//    
//    [cell.customDetailImage sd_setImageWithURL:[NSURL URLWithString:advertisement.advertisementPictureUrl]
//                             placeholderImage:nil];
    
    [cell.customDetailImage sd_setImageWithURL:[NSURL URLWithString:advertisement.advertisementPictureUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];

    [cell.customUserImage sd_setImageWithURL:[NSURL URLWithString:advertisement.advertisementUserPictureUrl] placeholderImage:nil];
    
    cell.customLabelPrice.text = [NSString stringWithFormat:@"%@€", advertisement.advertisementPrice];

    cell.customLabelStarter.text = advertisement.advertisementStarter;
    
    return cell;
}
//
//
//#pragma mark - TableView Delegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Navigation logic may go here. Create and push another view controller.
//    
//    
//    
//}
//
//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 170;
}


@end
