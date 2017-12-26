//
//  CountryParser.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 30.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "CountryParser.h"

@implementation CountryParser

+ (NSArray<Country *> *)parseWith:(NSData *)data {
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    if (![NSJSONSerialization isValidJSONObject:dictionary]) return nil;
    
    NSMutableArray<Country *> *countries = [NSMutableArray new];
    
    NSArray *array = dictionary[@"countries"];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *name = [obj objectForKey:@"name"];
        NSString *continent = [obj objectForKey:@"continent"];
        NSString *capital = [obj objectForKey:@"capital"];
        NSUInteger population = [[obj objectForKey:@"population"] unsignedIntegerValue];
        NSString *shortDescription = [obj objectForKey:@"description_small"];
        NSString *description = [obj objectForKey:@"description"];
        
        NSDictionary *countryInfo = [obj objectForKey:@"county_info"];
        NSString *flagImageUrlString = countryInfo[@"flag"];
        NSURL *flagImageURL = [[NSURL alloc] initWithString:flagImageUrlString];
        
        NSMutableArray<NSURL *> *imagesURL = [NSMutableArray new];
        id imagesUrlId = countryInfo[@"images"];
        if (![imagesUrlId isKindOfClass:[NSString class]]) {
            NSArray *imagesUrlString = countryInfo[@"images"];
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
