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

@interface MainViewController ()

@property (nonatomic, strong) id<DataRepository> repository;
@property (nonatomic, strong) NSArray *citiesArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.repository = [[NetworkDataRepository alloc]init];
    self.citiesArray = [[NSArray alloc]init];
    
    [self getAllCities];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) getAllCities{
    [self.repository getCitiesWithCompletionBlock:^(NSArray *cities, NSError *error) {
        NSLog(@"ok");
        self.citiesArray = cities;
    }];
}

@end
