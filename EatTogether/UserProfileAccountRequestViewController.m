//
//  UserProfileAccountRequestViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 24/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "UserProfileAccountRequestViewController.h"
#import "DataRepository.h"
#import "NetworkDataRepository.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "CurrentSessionManager.h"
#import "User.h"
#import "CustomRequestSendTableViewCell.h"


@interface UserProfileAccountRequestViewController ()


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) id<DataRepository> repository;
@property (nonatomic, strong) NSMutableArray *advertisementsArray;
@property (nonatomic, strong) CurrentSessionManager *currentSessionManager;

@end

@implementation UserProfileAccountRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.currentSessionManager = [CurrentSessionManager sharedInstance];
    
    self.repository = [[NetworkDataRepository alloc]init];
    self.advertisementsArray = [[NSMutableArray alloc]init];
    
    [self registerCustomCell];
    [self getReservationPending];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = @"Enviadas";
    self.tabBarController.tabBar.hidden = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) registerCustomCell{
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomRequestSendTableViewCell" bundle:nil]forCellReuseIdentifier:kCellFavorite];
}

-(void) getReservationPending{
    [self.repository getReservationWithUsername:self.currentSessionManager.currentUser.userObjectId WithCompletionBlock:^(NSArray *reservations, NSError *error) {
        self.advertisementsArray = [reservations mutableCopy];
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
    
    CustomRequestSendTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellFavorite forIndexPath:indexPath];
    
    Advertisement *advertisement = self.advertisementsArray[indexPath.row];
    
    [cell.customPicureAdvertisement sd_setImageWithURL:[NSURL URLWithString:advertisement.advertisementPictureUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    
    [cell.customPictureUser  sd_setImageWithURL:[NSURL URLWithString:advertisement.advertisementUserPictureUrl] placeholderImage:nil];
    
    cell.customPriceLabel.text = [NSString stringWithFormat:@"%@€", advertisement.advertisementPrice];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    
    cell.customDataLabel.text = [formatter stringFromDate:advertisement.advertisementData];
    cell.customStarterLabel.text = advertisement.advertisementStarter;
    
    return cell;

}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 220;
}

@end
