//
//  CountryDetailsTableViewController.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 01.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "CountryDetailsTableViewController.h"
#import "Country.h"

@interface CountryDetailsTableViewController ()
@property (nonatomic, strong) Country *country;
@end

@implementation CountryDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


@end
