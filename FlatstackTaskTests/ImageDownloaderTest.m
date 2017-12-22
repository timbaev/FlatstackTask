//
//  ImageDownloaderTest.m
//  FlatstackTaskTests
//
//  Created by Тимур Шафигуллин on 22.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ImageDownloader.h"

@interface ImageDownloaderTest : XCTestCase

@end


@implementation ImageDownloaderTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDownloadImage {
    //arrange
    NSURL *url = [[NSURL alloc] initWithString:@"https://wallpaperbrowse.com/media/images/750795.jpg"];
    NSString *description = [NSString stringWithString:@"Test download image from URL"];
    XCTestExpectation *expectation = [self expectationWithDescription:description];
    
    //act
    [ImageDownloader downloadFrom:url completionBlock:^(UIImage *image) {
        [expectation fulfill];
    }];
    
    //assert
    [self waitForExpectationsWithTimeout:10 handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
    }];
}

@end
