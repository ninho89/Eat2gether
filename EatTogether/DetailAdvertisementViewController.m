//
//  DetailAdvertisementViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 19/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "DetailAdvertisementViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailAdvertisementViewController ()

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


@end

@implementation DetailAdvertisementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupLabels];

}

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

#pragma mark - Buttons Methods

- (IBAction)reservaButton:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Reserva" message:@"Solicitud enviada" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
    
    [alert show];
}

@end
