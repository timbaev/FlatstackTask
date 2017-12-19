//
//  Country.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 28.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "Country.h"
#import "CountryManaged+CoreDataClass.h"
#import "CoreDataManager.h"

@implementation Country

/*Convenience initializers*/
- (id)initFromManagedObject:(CountryManaged *)countryManaged {
    NSMutableArray<NSURL *> *imagesURL = [NSKeyedUnarchiver unarchiveObjectWithData:countryManaged.imagesURL];
    NSURL *flagImageURL = [[NSURL alloc] initWithString:countryManaged.flagImageURL];
    
    self = [self initWithName:countryManaged.name continent:countryManaged.continent capital:countryManaged.capital population:countryManaged.population shortDescription:countryManaged.shortDescript fullDescription:countryManaged.fullDescription images:imagesURL flagImage:flagImageURL];
    return self;
}

/*Designated initializer*/
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

- (NSManagedObject *)toManagedObject {
    NSManagedObjectContext *viewContext = [[CoreDataManager sharedManager] viewContext];
    CountryManaged *countryManaged = [[CountryManaged alloc] initWithContext:viewContext];
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

@end
