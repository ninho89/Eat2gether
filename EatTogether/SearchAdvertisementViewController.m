//
//  SearchAdvertisementViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 20/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "SearchAdvertisementViewController.h"
#import "DetailCityListAdvertisementViewController.h"
#import "NetworkDataRepository.h"
#import "City.h"

@interface SearchAdvertisementViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, retain) NSMutableArray *totalCities;
@property (nonatomic, retain) UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) id<DataRepository> repository;
@property (nonatomic, strong) NSArray *citiesArray;
@property (nonatomic, assign) bool isFiltered;
@property (strong, nonatomic) NSMutableArray *filteredTableData;

@property (weak, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (weak, nonatomic) IBOutlet UILabel *selectedDate;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tap;

@property (nonatomic) int cont;



@end

@implementation SearchAdvertisementViewController

#pragma mark - View Life Cycles

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.searchBar.delegate = self;
    
    [self initializeArrays];
    [self createTableView];
    
    self.repository = [[NetworkDataRepository alloc]init];
    
    [self getAllCities];
    
    self.tap.enabled = NO;
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:self.tap];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationItem.title=@"Buscar";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{
                              NSForegroundColorAttributeName :[UIColor colorWithRed:0 green:0.478 blue:1 alpha:1],
                              NSFontAttributeName: [UIFont fontWithName:@"Helvetica Neue" size:24.0]
                              }];
    self.tabBarController.tabBar.tintColor = [UIColor redColor];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"Buscar";
    self.searchBar.text = @"";
    self.selectedDate.text = @"";
    self.tap.enabled = YES;
}

#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Initialize Arrays

-(void) initializeArrays{
    self.citiesArray = [[NSArray alloc]init];
    self.totalCities = [[NSMutableArray alloc] init];
}

#pragma mark - Get All Cities

-(void) getAllCities{
    [self.repository getCitiesWithCompletionBlock:^(NSArray *cities, NSError *error) {
        self.citiesArray = cities;
    }];
}

#pragma mark - Buttons Methods

-(void)dismissKeyboard {
    self.myDatePicker.hidden = YES;
    [self.searchBar resignFirstResponder];
}

//- (IBAction)chooseDate:(id)sender {
//    if(self.cont == 0){
//        self.myDatePicker.hidden = NO;
//        [self.myDatePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
//        self.cont = 1;
//    }else{
//        self.myDatePicker.hidden = YES;
//        self.cont = 0;
//    }
//}

//- (IBAction)chooseDate:(id)sender {
//    self.tap.enabled = YES;
//    self.myDatePicker.hidden = NO;
//    [self.myDatePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
//}



- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:datePicker.date];
    self.selectedDate.text = strDate;
}


#pragma mark - Create Table View

-(void) createTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 130, 350, 120) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = YES;
    self.tableView.hidden = YES;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.tableView];
}

#pragma mark - UISearchBar Delegate

- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring {
    
    [self.totalCities removeAllObjects];
    
    for(NSString *curString in [self.citiesArray valueForKey:kCityNameParse]) {
        NSRange substringRange = [curString rangeOfString:substring];
        if (substringRange.location == 0) {
            [self.totalCities addObject:curString];
        }
    }

    if(substring.length == 0)
    {
        self.isFiltered = FALSE;
    }
    else
    {
        self.isFiltered = true;
        self.filteredTableData = [[NSMutableArray alloc] init];
        
        for (City* city in self.citiesArray)
        {
            NSRange substringRange = [city.cityName rangeOfString:substring options:NSCaseInsensitiveSearch];
            if (substringRange.location == 0) {
                [self.filteredTableData addObject:city];
            }

        }
    }
    [self.tableView reloadData];
    
}


-(BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    self.tableView.hidden = NO;
    NSString *substring = [NSString stringWithString:searchBar.text];
    substring = [substring stringByReplacingCharactersInRange:range withString:text];
    [self searchAutocompleteEntriesWithSubstring:substring];
    
    return YES;
}

#pragma mark UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section {
    return self.totalCities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    City* city;
    if(self.isFiltered)
        city = [self.filteredTableData objectAtIndex:indexPath.row];
    else
        city = [self.citiesArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = city.cityName;
    self.tap.enabled = NO;
    
    return cell;
}

#pragma mark UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    self.searchBar.text = selectedCell.textLabel.text;
    [self.searchBar resignFirstResponder];
    self.tableView.hidden = YES;
    
    DetailCityListAdvertisementViewController *detailCityListViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:kStoryboardDetailCityListAdvertisementViewController];

    City* city;
    if(self.isFiltered)
    {
        city = [self.filteredTableData objectAtIndex:indexPath.row];
    }
    else
    {
        city = [self.citiesArray objectAtIndex:indexPath.row];
    }
    
    detailCityListViewController.city = city;
    [self.navigationController pushViewController:detailCityListViewController animated:true];
}

@end
