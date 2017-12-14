//
//  CountryManaged+CoreDataProperties.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 14.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//
//

#import "CountryManaged+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CountryManaged (CoreDataProperties)

+ (NSFetchRequest<CountryManaged *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *continent;
@property (nullable, nonatomic, copy) NSString *capital;
@property (nonatomic) int64_t population;
@property (nullable, nonatomic, copy) NSString *shortDescript;
@property (nullable, nonatomic, copy) NSString *fullDescription;
@property (nullable, nonatomic, retain) NSData *images;
@property (nullable, nonatomic, retain) NSData *flagImage;

@end

NS_ASSUME_NONNULL_END
