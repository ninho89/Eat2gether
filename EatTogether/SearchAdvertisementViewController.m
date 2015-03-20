//
//  SearchAdvertisementViewController.m
//  EatTogether
//
//  Created by Filippo Aresu on 20/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "SearchAdvertisementViewController.h"

@interface SearchAdvertisementViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, retain) NSMutableArray *searchCities;
@property (nonatomic, retain) NSMutableArray *totalCities;
@property (nonatomic, retain) UITableView *autocompleteTableView;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@end

@implementation SearchAdvertisementViewController

#pragma mark - View Life Cycles

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.searchBar.delegate = self;
    
    [self initializeArrays];
    [self createAutocompleteTableView];

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
}

#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Initialize Arrays

-(void) initializeArrays{
    self.searchCities = [[NSMutableArray alloc] initWithObjects:@"Barcelona", @"Malaga", @"Bilbao", @"Madrid", @"Sevilla", @"Valencia", nil];
    self.totalCities = [[NSMutableArray alloc] init];
}

#pragma mark - Create Table View

-(void) createAutocompleteTableView{
    self.autocompleteTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, 320, 120) style:UITableViewStylePlain];
    self.autocompleteTableView.delegate = self;
    self.autocompleteTableView.dataSource = self;
    self.autocompleteTableView.scrollEnabled = YES;
    self.autocompleteTableView.hidden = YES;
    [self.autocompleteTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.autocompleteTableView];
}

- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring {
    
    [self.totalCities removeAllObjects];
    for(NSString *curString in self.searchCities) {
        NSRange substringRange = [curString rangeOfString:substring];
        if (substringRange.location == 0) {
            [self.totalCities addObject:curString];
        }
    }
    [self.autocompleteTableView reloadData];
}

#pragma mark SearchBar methods
-(BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    self.autocompleteTableView.hidden = NO;
    
    NSString *substring = [NSString stringWithString:searchBar.text];
    substring = [substring stringByReplacingCharactersInRange:range withString:text];
    [self searchAutocompleteEntriesWithSubstring:substring];
    return YES;
}

#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section {
    return self.totalCities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"CellId"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellId"];
    }
    cell.textLabel.text = [self.totalCities objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    self.searchBar.text = selectedCell.textLabel.text;
    [self.searchBar resignFirstResponder];
    self.autocompleteTableView.hidden = YES;
    
    //go to city
}


@end
