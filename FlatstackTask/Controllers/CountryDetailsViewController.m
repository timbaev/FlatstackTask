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

@property (nonatomic, assign) CGFloat lastContentOffset;
@end

@implementation CountryDetailsViewController 

NSString *const DETAIL_CELL_IDENTIFIER = @"detailCellIdentifier";
NSString *const ABOUT_CELL_IDENTIFIER = @"aboutCellIdentifier";
NSString *const IMAGES_CELL_IDENTIFIER = @"imagesCellIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareTableView];
    [self prepareCollectionView];
}

#pragma mark - Prepare methods

- (void)prepareTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UINib *detailNibCell = [UINib nibWithNibName:@"CountryInfoTableViewCell" bundle:nil];
    UINib *aboutNibCell = [UINib nibWithNibName:@"CountryAboutTableViewCell" bundle:nil];
    
    [self.tableView registerNib:detailNibCell forCellReuseIdentifier:DETAIL_CELL_IDENTIFIER];
    [self.tableView registerNib:aboutNibCell forCellReuseIdentifier:ABOUT_CELL_IDENTIFIER];
    
    CGFloat collectionViewHeight = self.collectionView.frame.size.height;
    self.tableView.responderHeight = collectionViewHeight;
    self.tableView.contentInset = UIEdgeInsetsMake(collectionViewHeight, 0, 0, 0);
}

- (void)prepareCollectionView {
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.pageControl.hidesForSinglePage = true;
    
    UINib *photoNibCell = [UINib nibWithNibName:@"CountryImagesCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:photoNibCell forCellWithReuseIdentifier:IMAGES_CELL_IDENTIFIER];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
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
    NSLog(@"Scroll triggered! Content offset is %ld", (long)scrollView.contentOffset.y);
    if (scrollView.contentOffset.y < 0) {
        CGFloat collectionViewOffset = self.collectionViewTopConstraint.constant;
        CGFloat offset = (scrollView.contentOffset.y + self.collectionView.frame.size.height + collectionViewOffset) / 2;
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

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    self.pageControl.currentPage = indexPath.section;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.collectionView.frame.size;
}

@end
