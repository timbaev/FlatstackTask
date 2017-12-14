//
//  Repository.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 14.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Storable.h"

@protocol Repository <NSObject>
- (BOOL)insertWithModel:(id<Storable>)model;
- (NSArray<id<Storable>> *)getAll;
- (BOOL)updateModelWithID:(NSInteger)id;
- (BOOL)deleteModelWithID:(NSInteger)id;
@end
