//
//  CountryDetailsViewControllerTest.m
//  FlatstackTaskTests
//
//  Created by Тимур Шафигуллин on 21.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CountryDetailsViewController.h"
#import "ResponderTableView.h"
#import <OCMock/OCMock.h>

@interface CountryDetailsViewControllerTest : XCTestCase

@end

@interface CountryDetailsViewController (Testing)
@property (nonatomic) CGFloat collectionViewHeight;
@property (nonatomic) CGFloat navBarHeight;
@property (nonatomic) CGFloat statusBarHeight;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet ResponderTableView *tableView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

- (void)prepareTableView;
- (void)prepareCollectionView;
- (void)prepareNavigationBar;
- (void)preparePageControl;
@end

@implementation CountryDetailsViewControllerTest

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
    CountryDetailsViewController *countryDetailsVC = [[CountryDetailsViewController alloc] init];
    
    //act
    [countryDetailsVC viewDidLoad];
    
    //assert
    XCTAssertEqual(countryDetailsVC.collectionViewHeight, countryDetailsVC.collectionView.frame.size.height);
    XCTAssertEqual(countryDetailsVC.navBarHeight, countryDetailsVC.navigationController.navigationBar.frame.size.height);
    XCTAssertEqual(countryDetailsVC.statusBarHeight, [UIApplication sharedApplication].statusBarFrame.size.height);
}

- (void)testPrepareTableView {
    //arrange
    CountryDetailsViewController *countryDetailsVC = [[CountryDetailsViewController alloc] init];
    ResponderTableView *expectedTableView = [[ResponderTableView alloc] init];
    CGFloat expectedCollectionViewHeight = 300;
    CGFloat expectedNavBarHeight = 40;
    CGFloat expectedStatusBarHeight = 20;
    
    countryDetailsVC.tableView = expectedTableView;
    countryDetailsVC.collectionViewHeight = expectedCollectionViewHeight;
    countryDetailsVC.navBarHeight = expectedNavBarHeight;
    countryDetailsVC.statusBarHeight = expectedStatusBarHeight;
    
    //act
    [countryDetailsVC prepareTableView];
    
    //assert
    XCTAssertEqualObjects(countryDetailsVC.tableView.delegate, countryDetailsVC);
    XCTAssertEqualObjects(countryDetailsVC.tableView.dataSource, countryDetailsVC);
    XCTAssertEqual(countryDetailsVC.tableView.responderHeight, expectedCollectionViewHeight);
    XCTAssertEqual(countryDetailsVC.tableView.contentInset.top, expectedCollectionViewHeight - expectedNavBarHeight - expectedStatusBarHeight);
}

- (void)testPrepareCollectionView {
    //arrange
    CountryDetailsViewController *countryDetailsVC = [[CountryDetailsViewController alloc] init];
    countryDetailsVC.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *expectedCollectionView = [[UICollectionView alloc] initWithFrame:countryDetailsVC.view.frame collectionViewLayout:layout];
    countryDetailsVC.collectionView = expectedCollectionView;

    //act
    [countryDetailsVC prepareCollectionView];

    //assert
    XCTAssertEqualObjects(countryDetailsVC.collectionView.delegate, countryDetailsVC);
    XCTAssertEqualObjects(countryDetailsVC.collectionView.dataSource, countryDetailsVC);
}

- (void)testPrepareNavigationBar {
    //arrange
    CountryDetailsViewController *countryDetailsVC = [[CountryDetailsViewController alloc] init];
    UINavigationController *expectedNavigationController = [[UINavigationController alloc] initWithRootViewController:countryDetailsVC];
    
    //act
    [countryDetailsVC prepareNavigationBar];
    
    //assert
    XCTAssertNotNil([countryDetailsVC.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault]);
    XCTAssertNotNil(countryDetailsVC.navigationController.navigationBar.shadowImage);
    XCTAssertEqual(countryDetailsVC.navigationController.navigationBar.translucent, YES);
    XCTAssertEqual(countryDetailsVC.navigationController.view.backgroundColor, [UIColor clearColor]);
    XCTAssertEqual(countryDetailsVC.navigationController.navigationBar.tintColor, [UIColor whiteColor]);
    XCTAssertEqual(countryDetailsVC.navigationController.navigationBar.barStyle, UIBarStyleBlackTranslucent);
}

- (void)testPreparePageControl {
    //arrange
    CountryDetailsViewController *countryDetailsVC = [[CountryDetailsViewController alloc] init];
    UIPageControl *expectedPageControl = [[UIPageControl alloc] init];
    NSMutableArray<NSURL *> *expectedImagesURL = [NSMutableArray new];
    NSURL *url = [[NSURL alloc] init];
    [expectedImagesURL addObject:url];
    [expectedImagesURL addObject:url];
    
    Country *expectedCountry = [[Country alloc] initWithName:nil continent:nil capital:nil population:nil shortDescription:nil fullDescription:nil images:expectedImagesURL flagImage:nil];
    
    countryDetailsVC.pageControl = expectedPageControl;
    countryDetailsVC.country = expectedCountry;
    
    //act
    [countryDetailsVC preparePageControl];
    
    //assert
    XCTAssertEqual(countryDetailsVC.pageControl.hidesForSinglePage, true);
    XCTAssertEqual(countryDetailsVC.pageControl.numberOfPages, expectedCountry.imagesURL.count);
}

- (void)testViewWillDisappear {
    //arrange
    CountryDetailsViewController *countryDetailsVC = [[CountryDetailsViewController alloc] init];
    UINavigationController *expectedNavigationController = [[UINavigationController alloc] initWithRootViewController:countryDetailsVC];
    
    //act
    [countryDetailsVC viewWillDisappear:true];
    
    //assert
    XCTAssertEqual(countryDetailsVC.navigationController.navigationBar.barStyle, UIBarStyleDefault);
}

- (void)testTableViewPreferences {
    //arrange
    CountryDetailsViewController *countryDetailsVC = [[CountryDetailsViewController alloc] init];
    ResponderTableView *expectedTableView = [[ResponderTableView alloc] init];
    countryDetailsVC.tableView = expectedTableView;
    
    //act
    [countryDetailsVC viewDidLoad];
    
    //assert
    XCTAssertEqual(countryDetailsVC.tableView.numberOfSections, 1);
    XCTAssertEqual([countryDetailsVC.tableView numberOfRowsInSection:0], 4);
}

- (void)testCollectionViewPreferences {
    //arrange
    CountryDetailsViewController *countryDetailsVC = [[CountryDetailsViewController alloc] init];
    countryDetailsVC.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *expectedCollectionView = [[UICollectionView alloc] initWithFrame:countryDetailsVC.view.frame collectionViewLayout:layout];
    NSMutableArray<NSURL *> *expectedImagesURL = [NSMutableArray new];
    NSURL *url = [[NSURL alloc] init];
    [expectedImagesURL addObject:url];
    [expectedImagesURL addObject:url];
    Country *expectedCountry = [[Country alloc] initWithName:nil continent:nil capital:nil population:nil shortDescription:nil fullDescription:nil images:expectedImagesURL flagImage:nil];
    
    countryDetailsVC.collectionView = expectedCollectionView;
    countryDetailsVC.country = expectedCountry;
    
    //act
    [countryDetailsVC viewDidLoad];
    
    //assert
    XCTAssertEqual(countryDetailsVC.collectionView.numberOfSections, expectedCountry.imagesURL.count);
    XCTAssertEqual([countryDetailsVC.collectionView numberOfItemsInSection:0], 1);
}

@end
