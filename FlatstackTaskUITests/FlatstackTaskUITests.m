//
//  FlatstackTaskUITests.m
//  FlatstackTaskUITests
//
//  Created by Тимур Шафигуллин on 28.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface FlatstackTaskUITests : XCTestCase

@end

@implementation FlatstackTaskUITests

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)cellTapTest {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *cell = app.cells[@"country-0"];
    [cell tap];
}

@end
