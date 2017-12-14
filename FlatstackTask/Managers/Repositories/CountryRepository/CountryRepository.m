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
- (void)deleteAll {
    NSFetchRequest *request = [CountryManaged fetchRequest];
    NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:request];
    
    NSError *deleteError = nil;
    NSManagedObjectContext *viewContext = [[CoreDataManager sharedManager] viewContext];
    [viewContext.persistentStoreCoordinator executeRequest:delete withContext:viewContext error:&deleteError];
}
@end
