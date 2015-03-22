//
//  MapCityListAdvertisementViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 19/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "MapCityListAdvertisementViewController.h"
#import <MapKit/MapKit.h>
#import "Advertisement.h"

@interface MapCityListAdvertisementViewController () <MKMapViewDelegate, MKAnnotation, UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) MKPointAnnotation *myAnnotation;
@property (nonatomic, strong) Advertisement *adv;
@property (nonatomic, strong) NSMutableArray *locArr;


@end

@implementation MapCityListAdvertisementViewController

@synthesize coordinate;

#pragma mark - View Life Cycles

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mapView.delegate = self;
    self.myAnnotation = [[MKPointAnnotation alloc]init];
    [self getCityLocation];
    [self getCityAdvertisemts];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"Back";
    self.navigationController.navigationBar.topItem.backBarButtonItem = barButton;
    
    self.navigationItem.title = self.cities.cityName;
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{
                              NSForegroundColorAttributeName :[UIColor colorWithRed:0 green:0.478 blue:1 alpha:1],
                              NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:24.0]
                              }];
    

    UIButton* myInfoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [myInfoButton addTarget:self action:@selector(infoButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:myInfoButton];
    
}

#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Utils Methods

-(void) getCityLocation{
    CLLocationCoordinate2D cityCoord;
    cityCoord.latitude = [self.cities.cityLatitude doubleValue];
    cityCoord.longitude = [self.cities.cityLongitude doubleValue];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(cityCoord, 10000, 10000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}

-(void) getCityAdvertisemts{

    NSMutableArray *arrLocation = [[NSMutableArray alloc]init];
    for (Advertisement *advLoc in self.advArray) {
        
        CLLocation *towerLocation = [[CLLocation alloc] initWithLatitude:[advLoc.advertisementLocationLatitude floatValue] longitude:[advLoc.advertisementLocationLongitude floatValue]];
        [arrLocation addObject:towerLocation];
        [self.mapView addAnnotations:arrLocation];
    }
}
- (IBAction)tapGesture:(id)sender {
    
    NSLog(@"Tap");
    
}

-(void) infoButtonClicked{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Map Type" delegate:self cancelButtonTitle:@"Ok" destructiveButtonTitle:nil otherButtonTitles:@"Satellite", @"Standard", @"Hybrid",  nil];
    
    [actionSheet showInView:self.view];
}

#pragma mark - UIActionSheet Delegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            [self.mapView setMapType:MKMapTypeSatellite];
            break;
        case 1:
            [self.mapView setMapType:MKMapTypeStandard];
            break;
        case 2:
            [self.mapView setMapType:MKMapTypeHybrid];
        default:
            break;
    }
}




@end
