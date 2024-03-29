//
//  CountryTableViewController.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 28.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "CountryTableViewController.h"
#import "Country.h"
#import "CountryTableViewCell.h"
#import "Request.h"
#import "LoadCountryRequest.h"
#import "ApiProvider.h"
#import "Constants.h"
#import "CountryParser.h"
#import "CountryDetailsViewController.h"
#import "Repository.h"
#import "CountryRepository.h"

@interface CountryTableViewController ()
@property (nonatomic, strong, readwrite) NSMutableArray<Country *> *countries;
@property (nonatomic, strong, readwrite) id<Repository> repository;
@end

@implementation CountryTableViewController

NSString *const CounrtyCellIdentifier = @"countryCell";
NSString *const FIRST_END_POINT = @"NikitaAsabin/799e4502c9fc3e0ea7af439b2dfd88fa/raw/145611f98d4ef72b758966f00b25552a78437212/page1.json";
NSString *const DETAILS_SEGUE_IDENTIFIER = @"detailsSegue";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countries = [[NSMutableArray alloc] init];
    self.repository = [[CountryRepository alloc] init];
    
    [self prepareTableView];
    [self loadSavedCountries];
    [self loadCountries];
}

#pragma mark - Prepare methods

- (void)prepareTableView {
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    UINib *countryCellNib = [UINib nibWithNibName:@"CountryTableViewCell" bundle:nil];
    [self.tableView registerNib:countryCellNib forCellReuseIdentifier:CounrtyCellIdentifier];
    self.tableView.tableFooterView = [UIView new];
}

- (void)loadCountries {
    id<Request> request = [[LoadCountryRequest alloc] initWithEndPoint:FIRST_END_POINT];
    ApiProvider *provider = [[ApiProvider alloc] initWithBaseUrl:BASE_URL];
    __weak CountryTableViewController *weakSelf = self;
    [provider makeRequest:request completionBlock:^(NSData *data) {
        if (data != nil) {
            [(CountryRepository *)weakSelf.repository deleteAll];
            weakSelf.countries = [[CountryParser parseWith:data] mutableCopy];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.tableView reloadData];
            });
            for (Country *country in weakSelf.countries) {
                [weakSelf.repository insertWithModel:country];
            }
        }
    }];
}

- (void)loadSavedCountries {
    self.countries = [(NSArray<Country *> *)[self.repository getAllWithClass:Country.class] mutableCopy];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:DETAILS_SEGUE_IDENTIFIER]) {
        CountryDetailsViewController *detailsVC = segue.destinationViewController;
        detailsVC.country = sender;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.countries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CountryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CounrtyCellIdentifier];
    cell.accessibilityIdentifier = [NSString stringWithFormat:@"country-%ld", (long)indexPath.row];
    [cell prepareCellWithCountry:[self.countries objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:DETAILS_SEGUE_IDENTIFIER sender:self.countries[indexPath.row]];
}

@end
