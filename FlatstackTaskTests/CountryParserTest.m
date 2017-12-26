//
//  CountryParserTest.m
//  FlatstackTaskTests
//
//  Created by Тимур Шафигуллин on 26.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Storable.h"
#import "CountryParser.h"

@interface CountryParserTest : XCTestCase

@end

@implementation CountryParserTest

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    [super tearDown];
}

- (void)testParseData {
    //arrange
    NSString *json = @"{\n"
            "  \"next\":\"https://rawgit.com/NikitaAsabin/b37bf67c8668d54a517e02fdf0e0d435/raw/5e073b83bc46f6a323d40c8fc8f334dbf1bfb91a/page2.json\",\n"
            "  \"countries\":[\n"
            "  {\n"
            "  \"name\": \"Абхазия\",\n"
            "  \"continent\": \"Eurasia\",\n"
            "  \"capital\":\"Сухум\",\n"
            "  \"population\" : 243564 ,\n"
            "  \"description_small\": \"Description small\",\n"
            "  \"description\": \"Full description\",\n"
            "  \"image\": \"http://landmarks.ru/wp-content/uploads/2015/05/abhaziya.jpg\",\n"
            "  \"county_info\": {\n"
            "     \"images\":\"\",\n"
            "     \"flag\": \"https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Flag_of_Abkhazia.svg/600px-Flag_of_Abkhazia.svg.png\"\n"
            "   }\n"
            "  }"
            "]"
            "}";
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    Country *expectedCountry = [[Country alloc] initWithName:@"Абхазия" continent:@"Eurasia" capital:@"Сухум"
                                                  population:243564 shortDescription:@"Description small"
                                             fullDescription:@"Full description" images:[NSMutableArray new]
                                                   flagImage:[[NSURL alloc] initWithString:@"https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Flag_of_Abkhazia.svg/600px-Flag_of_Abkhazia.svg.png"]];
    //act
    NSArray<Country *> *countries = [CountryParser parseWith:jsonData];
    Country *resultCountry = [countries firstObject];
    
    //assert
    XCTAssertEqualObjects(expectedCountry, resultCountry);
}

@end
