//
//  CountryParser.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 30.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Country.h"

@interface CountryParser : NSObject
+ (NSArray<Country *> *)parseWith:(NSDictionary *)dictionary;
@end
