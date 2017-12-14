//
//  Storable.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 14.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@protocol Storable <NSObject>
- (NSManagedObject *)toManagedObject;
@end
