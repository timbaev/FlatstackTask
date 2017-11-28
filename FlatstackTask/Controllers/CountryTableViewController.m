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

@interface CountryTableViewController ()
@property (nonatomic, strong) NSMutableArray<Country *> *countries;
@end

@implementation CountryTableViewController

NSString *const CounrtyCellIdentifier = @"countryCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.countries = [[NSMutableArray alloc] init];
    Country* country1 = [[Country alloc] initWithName:@"Argentina" continent:@"America" capital:@"Buenos Aires" population:123 shortDescription:@"Short description about Argentina" fullDescription:@"Full description" images:nil flagImage:[[UIImage alloc] initWithContentsOfFile:@"argentinaFlag"]];
    Country* country2 = [[Country alloc] initWithName:@"Brazil" continent:@"America" capital:@"Brasilia" population:123 shortDescription:@"Short description about Brazil" fullDescription:@"Full description" images:nil flagImage:[[UIImage alloc] initWithContentsOfFile:@"argentinaFlag"]];
    [self.countries addObject:country1];
    [self.countries addObject:country2];
    
    [self prepareTableView];
}

#pragma mark - Prepare methods

- (void)prepareTableView {
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    UINib *countryCellNib = [UINib nibWithNibName:@"CountryTableViewCell" bundle:nil];
    [self.tableView registerNib:countryCellNib forCellReuseIdentifier:CounrtyCellIdentifier];
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
    [cell prepareCellWithCountry:[self.countries objectAtIndex:indexPath.row]];
    return cell;
}

@end
