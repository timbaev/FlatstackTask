//
//  BaseRepository.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 14.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Repository.h"
#import "CoreDataManager.h"

@interface BaseRepository : NSObject<Repository>
@property (strong, nonatomic) CoreDataManager *manager;
@end
