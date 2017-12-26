//
//  CountryRepositoryTest.m
//  FlatstackTaskTests
//
//  Created by Тимур Шафигуллин on 26.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "CoreDataManager.h"
#import "CountryRepository.h"
#import "Country.h"

@interface CountryRepositoryTest : XCTestCase

@end


@implementation CountryRepositoryTest

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    [super tearDown];
}

- (void)testDeleteAll {
    //arrange
    id coreDaraManagerMoc = OCMClassMock([CoreDataManager class]);
    CountryRepository *repository = [[CountryRepository alloc] init];
    repository.manager = coreDaraManagerMoc;
    Country *country = [[Country alloc] initWithName:@"Test" continent:@"Test" capital:@"Test" population:5 shortDescription:@"Test" fullDescription:@"Test" images:nil flagImage:nil];
    [repository insertWithModel:country];
    NSArray *expectedArray = [NSArray new];

    //act
    [repository deleteAll];

    //assert
    XCTAssertEqualObjects(expectedArray, [repository getAllWithClass:[Country class]]);
}

@end
