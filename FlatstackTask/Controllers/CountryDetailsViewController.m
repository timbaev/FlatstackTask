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
#import "ImageDownloader.h"
#import "ResponderTableView.h"

@interface CountryDetailsViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet ResponderTableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewTopConstraint;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewTopConstraint;

@property (nonatomic) CGFloat collectionViewHeight;
@property (nonatomic) CGFloat navBarHeight;
@property (nonatomic) CGFloat statusBarHeight;
@end

@implementation CountryDetailsViewController 

NSString *const DETAIL_CELL_IDENTIFIER = @"detailCellIdentifier";
NSString *const ABOUT_CELL_IDENTIFIER = @"aboutCellIdentifier";
NSString *const IMAGES_CELL_IDENTIFIER = @"imagesCellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionViewHeight = self.collectionView.frame.size.height;
    self.navBarHeight = self.navigationController.navigationBar.frame.size.height;
    self.statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    
    [self prepareTableView];
    [self prepareCollectionView];
    [self prepareNavigationBar];
    [self preparePageControl];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

#pragma mark - Prepare methods

- (void)prepareTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *detailNibCell = [UINib nibWithNibName:@"CountryInfoTableViewCell" bundle:nil];
    UINib *aboutNibCell = [UINib nibWithNibName:@"CountryAboutTableViewCell" bundle:nil];
    
    [self.tableView registerNib:detailNibCell forCellReuseIdentifier:DETAIL_CELL_IDENTIFIER];
    [self.tableView registerNib:aboutNibCell forCellReuseIdentifier:ABOUT_CELL_IDENTIFIER];
    
    self.tableView.responderHeight = self.collectionViewHeight;
    self.tableView.contentInset = UIEdgeInsetsMake(self.collectionViewHeight - self.navBarHeight - self.statusBarHeight, 0, 0, 0);
}

- (void)preparePageControl {
    self.pageControl.hidesForSinglePage = true;
    self.pageControl.numberOfPages = self.country.imagesURL.count;
}

- (void)prepareCollectionView {
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    UINib *photoNibCell = [UINib nibWithNibName:@"CountryImagesCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:photoNibCell forCellWithReuseIdentifier:IMAGES_CELL_IDENTIFIER];
}

- (void)prepareNavigationBar {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
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
    if (row == 3) {
        CountryAboutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ABOUT_CELL_IDENTIFIER forIndexPath:indexPath];
        [cell prepareCellWithDescription:self.country.fullDescription];
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"Content offset is %ld", (long)scrollView.contentOffset.y);
    if (scrollView.contentOffset.y < 0) {
        CGFloat collectionViewOffset = self.collectionViewTopConstraint.constant;
        CGFloat offset = (scrollView.contentOffset.y + self.collectionViewHeight + collectionViewOffset - self.navBarHeight - self.statusBarHeight) / 2;
        NSLog(@"CollectionViewOffset: %ld", (long)collectionViewOffset);
        NSLog(@"Changed image top to: %ld", (long)offset);

        self.collectionViewTopConstraint.constant = -offset;
    }
}

#pragma mark - Collection view data sorce

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.country.imagesURL.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CountryImagesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IMAGES_CELL_IDENTIFIER forIndexPath:indexPath];
    
    NSURL *imageURL = self.country.imagesURL[indexPath.section];
    [ImageDownloader downloadFrom:imageURL completionBlock:^(UIImage *resultImage) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell prepareCellWithImage:resultImage];
        });
    }];
    
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.collectionView.frame.size.width;
    self.pageControl.currentPage = self.collectionView.contentOffset.x / pageWidth;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectionView.frame.size;
}

@end
