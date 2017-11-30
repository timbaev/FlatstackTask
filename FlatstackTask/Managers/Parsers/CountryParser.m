//
//  CountryParser.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 30.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "CountryParser.h"
#import "Country.h"

@implementation CountryParser

+ (NSArray<Country *> *)parseWith:(NSDictionary *)dictionary {
    NSMutableArray<Country *> *countries = [NSMutableArray new];
    
    NSArray *array = [dictionary objectForKey:@"countries"];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *name = [obj objectForKey:@"name"];
        NSString *continent = [obj objectForKey:@"continent"];
        NSString *capital = [obj objectForKey:@"capital"];
        NSUInteger population = [[obj objectForKey:@"population"] unsignedIntegerValue];
        NSString *shortDescription = [obj objectForKey:@"description_small"];
        NSString *description = [obj objectForKey:@"description"];
        
        NSDictionary *countryInfo = [obj objectForKey:@"county_info"];
        NSString *flagImageUrlString = [countryInfo objectForKey:@"flag"];
        NSURL *flagImageURL = [[NSURL alloc] initWithString:flagImageUrlString];
        
        NSMutableArray<NSURL *> *imagesURL = [NSMutableArray new];
        id imagesUrlId = [countryInfo objectForKey:@"images"];
        if (![imagesUrlId isKindOfClass:[NSString class]]) {
            NSArray *imagesUrlString = [countryInfo objectForKey:@"images"];
            for (NSString *urlString in imagesUrlString) {
                NSURL *url = [[NSURL alloc] initWithString:urlString];
                [imagesURL addObject:url];
            }
        }
        
        
        Country *country = [[Country alloc] initWithName:name continent:continent capital:capital population:population shortDescription:shortDescription fullDescription:description images:imagesURL flagImage:flagImageURL];
        [countries addObject:country];
    }];
    
    return countries;
}

@end
