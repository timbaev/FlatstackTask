//
//  BaseRepository.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 14.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "BaseRepository.h"
#import "CoreDataManager.h"

@implementation BaseRepository

- (BOOL)deleteModelWithID:(NSInteger)id {
    return true;
}

- (NSArray<id<Storable>> *)getAll {
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
