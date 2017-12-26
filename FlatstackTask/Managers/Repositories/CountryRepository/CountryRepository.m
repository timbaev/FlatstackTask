//
//  CountryRepository.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 14.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "CountryRepository.h"
#import "CountryManaged+CoreDataClass.h"
#import "CoreDataManager.h"

@implementation CountryRepository

- (instancetype)init
{
    self = [super init];
    if (self) {}
    return self;
}

- (void)deleteAll {
    NSFetchRequest *request = [CountryManaged fetchRequest];
    NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:request];
    
    NSError *deleteError = nil;
    NSManagedObjectContext *viewContext = [self.manager viewContext];
    [viewContext.persistentStoreCoordinator executeRequest:delete withContext:viewContext error:&deleteError];
}
@end
