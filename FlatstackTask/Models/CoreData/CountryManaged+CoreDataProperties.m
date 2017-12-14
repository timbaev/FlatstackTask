//
//  CountryManaged+CoreDataProperties.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 14.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//
//

#import "CountryManaged+CoreDataProperties.h"

@implementation CountryManaged (CoreDataProperties)

+ (NSFetchRequest<CountryManaged *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CountryManaged"];
}

@dynamic name;
@dynamic continent;
@dynamic capital;
@dynamic population;
@dynamic shortDescript;
@dynamic fullDescription;
@dynamic images;
@dynamic flagImage;

@end
