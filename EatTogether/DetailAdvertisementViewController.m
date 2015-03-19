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
@property (weak, nonatomic) IBOutlet UILabel *labelAdvertisementDescription;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvertisementStarter;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvertisementMainDish;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvertisementDessert;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvertisementNumGuests;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvertisementDate;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvertisementPrice;
@property (weak, nonatomic) IBOutlet UIImageView *imageUsername;
@property (weak, nonatomic) IBOutlet UIImageView *imageAdvertisement;

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
- (IBAction)reservaButton:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Reserva" message:@"Solicitud enviada" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Cancel", nil];
    
    [alert show];
}

-(void) setupLabels{
    self.labelAdvertisementDescription.text = [NSString stringWithFormat:@"%@",self.advertisement.advertisementDescription];
    self.labelAdvertisementStarter.text = self.advertisement.advertisementStarter;
    self.labelAdvertisementMainDish.text = [NSString stringWithFormat:@"%@",self.advertisement.advertisementMainDish];
    self.labelAdvertisementDessert.text = [NSString stringWithFormat:@"%@",self.advertisement.advertisementDessert ];
    self.labelAdvertisementNumGuests.text = [NSString stringWithFormat:@"%@", self.advertisement.advertisementNumGuests];
    self.labelAdvertisementDate.text = [NSString stringWithFormat:@"%@",self.advertisement.advertisementData];
    self.labelAdvertisementPrice.text = [NSString stringWithFormat:@"%@", self.advertisement.advertisementPrice];
    
    self.imageUsername.clipsToBounds = YES;
    self.imageUsername.layer.cornerRadius = self.imageUsername.bounds.size.height / 2.0f;
    
    
    [self.imageAdvertisement sd_setImageWithURL:[NSURL URLWithString:self.advertisement.advertisementPictureUrl]];
    [self.imageUsername sd_setImageWithURL:[NSURL URLWithString:self.advertisement.advertisementUserPictureUrl]];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
