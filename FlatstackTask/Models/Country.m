//
//  Country.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 28.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "Country.h"
#import "CoreDataManager.h"

@implementation Country

/*Convenience initializers*/
- (id)initFromManagedObject:(CountryManaged *)countryManaged {
    NSMutableArray<NSURL *> *imagesURL = [NSKeyedUnarchiver unarchiveObjectWithData:countryManaged.imagesURL];
    NSURL *flagImageURL = nil;
    if (countryManaged.flagImageURL != nil) {
        flagImageURL = [[NSURL alloc] initWithString:countryManaged.flagImageURL];
    }
    
    self = [self initWithName:countryManaged.name continent:countryManaged.continent capital:countryManaged.capital
                   population:(NSUInteger) countryManaged.population shortDescription:countryManaged.shortDescript
              fullDescription:countryManaged.fullDescription images:imagesURL flagImage:flagImageURL];
    return self;
}

/*Designated initializer*/
- (id)initWithName:(NSString *)name continent:(NSString *)contentent capital:(NSString *)capital
        population:(NSUInteger)population shortDescription:(NSString *)shortDescription
   fullDescription:(NSString *)fullDescription images:(NSMutableArray<NSURL *> *)imagesURL
         flagImage:(NSURL *)flagImageURL {
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

- (NSManagedObject *)toManagedObjectInContext:(NSManagedObjectContext *)context {
    CountryManaged *countryManaged = [[CountryManaged alloc] initWithContext:context];
    countryManaged.name = self.name;
    countryManaged.continent = self.continent;
    countryManaged.capital = self.capital;
    countryManaged.population = self.population;
    countryManaged.shortDescript = self.shortDescription;
    countryManaged.fullDescription = self.fullDescription;
    countryManaged.flagImageURL = self.flagImageURL.absoluteString;
    
    NSData *imagesUrlData = [NSKeyedArchiver archivedDataWithRootObject:self.imagesURL];
    countryManaged.imagesURL = imagesUrlData;
    
    return countryManaged;
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;

    return [self isEqualToCountry:other];
}

- (BOOL)isEqualToCountry:(Country *)country {
    if (self == country)
        return YES;
    if (country == nil)
        return NO;
    if (self.name != country.name && ![self.name isEqualToString:country.name])
        return NO;
    if (self.continent != country.continent && ![self.continent isEqualToString:country.continent])
        return NO;
    if (self.capital != country.capital && ![self.capital isEqualToString:country.capital])
        return NO;
    if (self.population != country.population)
        return NO;
    if (self.shortDescription != country.shortDescription && ![self.shortDescription isEqualToString:country.shortDescription])
        return NO;
    if (self.fullDescription != country.fullDescription && ![self.fullDescription isEqualToString:country.fullDescription])
        return NO;
    if (self.imagesURL != country.imagesURL && ![self.imagesURL isEqualToArray:country.imagesURL])
        return NO;
    return !(self.flagImageURL != country.flagImageURL && ![self.flagImageURL isEqual:country.flagImageURL]);
}

- (NSUInteger)hash {
    NSUInteger hash = [self.name hash];
    hash = hash * 31u + [self.continent hash];
    hash = hash * 31u + [self.capital hash];
    hash = hash * 31u + self.population;
    hash = hash * 31u + [self.shortDescription hash];
    hash = hash * 31u + [self.fullDescription hash];
    hash = hash * 31u + [self.imagesURL hash];
    hash = hash * 31u + [self.flagImageURL hash];
    return hash;
}


@end
