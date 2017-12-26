//
//  ApiProviderTest.m
//  FlatstackTaskTests
//
//  Created by Тимур Шафигуллин on 26.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ApiProvider.h"
#import <OCMock/OCMock.h>
#import "LoadCountryRequest.h"

@interface LoadCountryRequestTest : XCTestCase

@end

@implementation LoadCountryRequestTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testMakeLoadCountryRequest {
    //arrange
    ApiProvider *apiProvider = [[ApiProvider alloc] initWithBaseUrl:@"https://rawgit.com"];
    LoadCountryRequest *request = [[LoadCountryRequest alloc] initWithEndPoint:@"NikitaAsabin/b37bf67c8668d54a517e02fdf0e0d435/raw/5e073b83bc46f6a323d40c8fc8f334dbf1bfb91a/page2.json"];
    
    NSString *description = @"Test LoadCountryRequest";
    XCTestExpectation *expectation = [self expectationWithDescription:description];
    
    //act
    [apiProvider makeRequest:request completionBlock:^(NSData *data) {
        XCTAssertNotNil(data);
        [expectation fulfill];
    }];
    
    //assert
    [self waitForExpectationsWithTimeout:10 handler:^(NSError *error) {
        XCTAssertNil(error);
    }];
}

@end
