//
//  Country.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 28.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "Country.h"

@implementation Country

- (id)initWithName:(NSString *)name continent:(NSString *)contentent capital:(NSString *)capital population:(NSUInteger)population shortDescription:(NSString *)shortDescription fullDescription:(NSString *)fullDescription images:(NSMutableArray<UIImage *> *)images flagImage:(UIImage *)flagImage {
    
    self = [super init];
    if (self) {
        self.name = name;
        self.continent = contentent;
        self.capital = capital;
        self.population = population;
        self.shortDescription = shortDescription;
        self.fullDescription = fullDescription;
        self.images = images;
        self.flagImage = flagImage;
    }
    
    return self;
}

@end
