//
//  BaseRepostitoryTest.m
//  FlatstackTaskTests
//
//  Created by Тимур Шафигуллин on 22.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <CoreData/CoreData.h>
#import "CoreDataManager.h"
#import "BaseRepository.h"
#import "Country.h"

@interface BaseRepostitoryTest : XCTestCase

@end

@interface CoreDataManager (Testing)
@property (strong) NSPersistentContainer *persistentContainer;
@end


@implementation BaseRepostitoryTest

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    [super tearDown];
}

- (void)testInsertModel {
    //arrange
    id coreDataManagerMoc = OCMClassMock([CoreDataManager class]);

    BaseRepository *repository = [[BaseRepository alloc] init];
    repository.manager = coreDataManagerMoc;
    Country *expecredCountry = [[Country alloc] initWithName:@"Test" continent:@"Test" capital:@"Test" population:15 shortDescription:@"Test" fullDescription:@"Test" images:nil flagImage:nil];
    BOOL expectedResult = true;
    
    //act
    BOOL actionResult = [repository insertWithModel:expecredCountry];
    
    //assert
    OCMVerify(repository.manager.saveContext);
    XCTAssertEqual(actionResult, expectedResult);
}

- (void)testGetAllCountries {
    //arrange
    BaseRepository *repository = [[BaseRepository alloc] init];
    id coreDataManagerMoc = OCMClassMock([CoreDataManager class]);
    repository.manager = coreDataManagerMoc;
    
    Country *expectedCountry = [[Country alloc] initWithName:@"Test" continent:@"Test" capital:@"Test" population:15 shortDescription:@"Test" fullDescription:@"Test" images:nil flagImage:nil];
    [repository insertWithModel:expectedCountry];
    NSArray<Country *> *expectedCountries = @[expectedCountry];
    //act
    NSArray<Country *> *countries = [repository getAllWithClass:[Country class]];

    //assert
    XCTAssertEqualObjects(expectedCountries, countries);
}

@end
