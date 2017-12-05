//
//  CountryDetailsViewController.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 05.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "CountryDetailsViewController.h"
#import "CountryInfoTableViewCell.h"
#import "CountryImagesCollectionViewCell.h"
#import "CountryAboutTableViewCell.h"
#import "Country.h"

@interface CountryDetailsViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation CountryDetailsViewController 

NSString *const DETAIL_CELL_IDENTIFIER = @"detailCellIdentifier";
NSString *const ABOUT_CELL_IDENTIFIER = @"aboutCellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareTableView];
}

#pragma mark - Prepare methods

- (void)prepareTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UINib *detailNibCell = [UINib nibWithNibName:@"CountryInfoTableViewCell" bundle:nil];
    UINib *aboutNibCell = [UINib nibWithNibName:@"CountryAboutTableViewCell" bundle:nil];
    
    [self.tableView registerNib:detailNibCell forCellReuseIdentifier:DETAIL_CELL_IDENTIFIER];
    [self.tableView registerNib:aboutNibCell forCellReuseIdentifier:ABOUT_CELL_IDENTIFIER];
    
    CGFloat collectionViewHeight = self.collectionView.frame.size.height;
    self.tableView.contentInset = UIEdgeInsetsMake(collectionViewHeight, 0, 0, 0);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (row == 0 || row == 1 || row == 2) {
        CountryInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DETAIL_CELL_IDENTIFIER forIndexPath:indexPath];
        [cell prepareCellWithCountry:self.country row:row];
        return cell;
    }
    if (row == 4) {
        CountryAboutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ABOUT_CELL_IDENTIFIER forIndexPath:indexPath];
        [cell prepareCellWithDescription:self.country.fullDescription];
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}


@end
