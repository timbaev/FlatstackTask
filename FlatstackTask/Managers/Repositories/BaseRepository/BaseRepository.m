//
//  BaseRepository.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 14.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "BaseRepository.h"
#import "CoreDataManager.h"
#import "Country.h"
#import "CountryManaged+CoreDataClass.h"

@implementation BaseRepository

- (BOOL)deleteModelWithID:(NSInteger)id {
    return true;
}

- (NSArray<id<Storable>> *)getAllWithClass:(Class)class {
    if ([Country class] == class) {
        NSManagedObjectContext *viewContext = [[CoreDataManager sharedManager] viewContext];
        NSFetchRequest *request = [CountryManaged fetchRequest];
        NSError *error = nil;
        NSArray *results = [viewContext executeFetchRequest:request error:&error];
        
        if (error == nil) {
            NSMutableArray *countries = [NSMutableArray array];
            for (CountryManaged *countryManaged in results) {
                Country *country = [[Country alloc] initFromManagedObject:countryManaged];
                [countries addObject:country];
            }
            return countries;
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }
    return nil;
}

- (BOOL)insertWithModel:(__autoreleasing id<Storable>)model {
    [model toManagedObject];
    [[CoreDataManager sharedManager] saveContext];
    return true;
}

- (BOOL)updateModelWithID:(NSInteger)id {
    return true;
}

@end
