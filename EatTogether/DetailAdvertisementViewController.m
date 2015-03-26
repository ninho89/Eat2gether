//
//  DetailAdvertisementViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 19/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "DetailAdvertisementViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <MapKit/MapKit.h>
#import "CurrentSessionManager.h"
#import "NetworkDataRepository.h"

@interface DetailAdvertisementViewController () <MKMapViewDelegate, MKAnnotation>

@property (weak, nonatomic) IBOutlet UIImageView *imageAdvertisement;
@property (weak, nonatomic) IBOutlet UIImageView *imageUsername;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvertisementDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvertisementStarter;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvertisementMainDish;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvertisementDessert;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvertisementNumGuests;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvertisementDate;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvertisementPrice;
@property (strong, nonatomic) MKMapView *mapView;
@property (nonatomic, strong) MKPointAnnotation *myAnnotation;
@property (nonatomic, strong) CurrentSessionManager *currentSessionManager;
@property (nonatomic, strong) id<DataRepository> repository;


@end

@implementation DetailAdvertisementViewController

@synthesize coordinate;

#pragma mark - View Life Cycles

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.currentSessionManager = [CurrentSessionManager sharedInstance];
    self.repository = [[NetworkDataRepository alloc]init];
    
    [self setupLabels];
    [self setupMapView];
    [self getAdvertisementLocation];


}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Utils Methods

-(void) setupLabels{
    self.labelAdvertisementDescription.text = [NSString stringWithFormat:@"%@",self.advertisement.advertisementDescription];
    self.labelAdvertisementStarter.text = self.advertisement.advertisementStarter;
    self.labelAdvertisementMainDish.text = [NSString stringWithFormat:@"%@",self.advertisement.advertisementMainDish];
    self.labelAdvertisementDessert.text = [NSString stringWithFormat:@"%@",self.advertisement.advertisementDessert ];
    self.labelAdvertisementNumGuests.text = [NSString stringWithFormat:@"%@", self.advertisement.advertisementNumGuests];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    
    self.labelAdvertisementDate.text = [formatter stringFromDate:self.advertisement.advertisementData];

    self.labelAdvertisementPrice.text = [NSString stringWithFormat:@"%@ €", self.advertisement.advertisementPrice];
    
    self.imageUsername.clipsToBounds = YES;
    self.imageUsername.layer.cornerRadius = self.imageUsername.bounds.size.height / 2.0f;
    
    
    [self.imageAdvertisement sd_setImageWithURL:[NSURL URLWithString:self.advertisement.advertisementPictureUrl]];
    [self.imageUsername sd_setImageWithURL:[NSURL URLWithString:self.advertisement.advertisementUserPictureUrl]];
}

-(void) setupMapView{
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height+20, self.view.frame.size.width, 335)];
    self.mapView.scrollEnabled = NO;
    [self.scrollView addSubview:self.mapView];
}

-(void) getAdvertisementLocation{
    CLLocationCoordinate2D cityCoord;
    cityCoord.latitude = [self.advertisement.advertisementLocationLatitude doubleValue];
    cityCoord.longitude = [self.advertisement.advertisementLocationLongitude doubleValue];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(cityCoord, 1500, 1500);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    self.myAnnotation = [[MKPointAnnotation alloc]init];
    self.myAnnotation.coordinate = cityCoord;
    [self.mapView addAnnotation:self.myAnnotation];
}

#pragma mark - Buttons Methods

- (IBAction)reservaButton:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Reserva" message:@"¿Hacer la reserva?" delegate:self cancelButtonTitle:@"Si" otherButtonTitles:@"No", nil];
    
    [alert show];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // 0 = Tapped yes
    if (buttonIndex == 0)
    {
        //NSLog(@"ok");
        if([self.currentSessionManager isLoggedIn]){
             //add reservation
            NSLog(@"se procede a la reserva");
            User *user = self.currentSessionManager.currentUser;
            [self.repository setReservation:@(1) withAdvertisement:self.advertisement user:user completionBlock:^(NSArray *reservation, NSError *error) {
                
            }];
            
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Tienes que loguearte para hacer una reserva" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }else{
        NSLog(@"cancel");
    }
}


@end
