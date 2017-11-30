//
//  Country.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 28.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "Country.h"

@implementation Country

- (id)initWithName:(NSString *)name continent:(NSString *)contentent capital:(NSString *)capital population:(NSUInteger)population shortDescription:(NSString *)shortDescription fullDescription:(NSString *)fullDescription images:(NSMutableArray<NSURL *> *)imagesURL flagImage:(NSURL *)flagImageURL {
    self = [super init];
    if (self) {
        self.name = name;
        self.continent = contentent;
        self.capital = capital;
        self.population = population;
        self.shortDescription = shortDescription;
        self.fullDescription = fullDescription;
        self.imagesURL = imagesURL;
        self.flagImageURL = flagImageURL;
    }
    
    return self;
}

@end
