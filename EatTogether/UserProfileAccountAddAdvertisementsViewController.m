//
//  UserProfileAccountAddAdvertisementsViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 24/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "UserProfileAccountAddAdvertisementsViewController.h"

@interface UserProfileAccountAddAdvertisementsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *starterTextField;
@property (weak, nonatomic) IBOutlet UITextField *mainDishTextField;
@property (weak, nonatomic) IBOutlet UITextField *dessertTextField;
@property (weak, nonatomic) IBOutlet UIStepper *numInvStepper;
@property (weak, nonatomic) IBOutlet UILabel *numInvLabel;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

@property (weak, nonatomic) IBOutlet UILabel *selectedDate;



@end

@implementation UserProfileAccountAddAdvertisementsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tapGesture.enabled = NO;
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:self.tapGesture];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    UIBarButtonItem *barButtonAdd = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAdvertisement)];
    self.navigationItem.rightBarButtonItem = barButtonAdd;
    self.tabBarController.tabBar.hidden = YES;
    self.selectedDate.text = @"";
    self.tapGesture.enabled = YES;
    
}

- (IBAction)chooseDate:(id)sender {
    self.tapGesture.enabled = YES;
    self.datePicker.hidden = NO;
    [self.datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
}



- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:datePicker.date];
    self.selectedDate.text = strDate;
}

-(void)dismissKeyboard {
    self.datePicker.hidden = YES;
    [self.dessertTextField resignFirstResponder];
    [self.starterTextField resignFirstResponder];
    [self.mainDishTextField resignFirstResponder];
    [self.dessertTextField resignFirstResponder];
    [self.priceTextField resignFirstResponder];
}
- (IBAction)changeValueStepper:(id)sender {
    
    self.numInvLabel.text = [NSString stringWithFormat:@"%.f",self.numInvStepper.value];
}

-(void) saveAdvertisement{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePhoto:(id)sender {
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
