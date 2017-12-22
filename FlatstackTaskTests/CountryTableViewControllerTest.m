//
//  FlatstackTaskTests.m
//  FlatstackTaskTests
//
//  Created by Тимур Шафигуллин on 28.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CountryTableViewController.h"
#import "CountryRepository.h"

@interface FlatstackTaskTests : XCTestCase

@end

@interface CountryTableViewController (Testing)
- (void)prepareTableView;
- (void)loadSavedCountries;
@property (nonatomic, strong) id<Repository> repository;
@end

@implementation FlatstackTaskTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testViewDidLoad {
    //arrange
    CountryTableViewController *countryTableVC = [[CountryTableViewController alloc] init];
    
    //act
    [countryTableVC viewDidLoad];
    
    //assert
    XCTAssertNotNil(countryTableVC.countries);
    XCTAssertNotNil(countryTableVC.repository);
}

- (void)testPrepareTableView {
    //arrange
    CountryTableViewController *countryTableVC = [[CountryTableViewController alloc] init];
    
    //act
    [countryTableVC prepareTableView];
    
    //assert
    XCTAssertEqual(countryTableVC.tableView.estimatedRowHeight, 44.0);
    XCTAssertEqual(countryTableVC.tableView.rowHeight, UITableViewAutomaticDimension);
    XCTAssertNotNil(countryTableVC.tableView.tableFooterView);
    XCTAssertEqual(countryTableVC.tableView.numberOfSections, 1);
}

- (void)testLoadCountriesFromRepository {
    //arrange
    CountryTableViewController *countryTableVC = [[CountryTableViewController alloc] init];
    countryTableVC.repository = [[CountryRepository alloc] init];
    
    //act
    [countryTableVC loadSavedCountries];
    
    //assert
    XCTAssertNotNil(countryTableVC.countries);
}

@end
