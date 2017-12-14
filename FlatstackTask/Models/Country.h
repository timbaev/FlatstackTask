//
//  Country.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 28.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Storable.h"

@interface Country : NSObject<Storable>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *continent;
@property (nonatomic, strong) NSString *capital;
@property (nonatomic) NSUInteger population;
@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, strong) NSString *fullDescription;
@property (nonatomic, strong) NSMutableArray<NSURL *> *imagesURL;
@property (nonatomic, strong) NSURL *flagImageURL;

- (id)initWithName:(NSString *)name continent:(NSString *)contentent capital:(NSString *)capital population:(NSUInteger)population shortDescription:(NSString *)shortDescription fullDescription:(NSString *)fullDescription images:(NSMutableArray<NSURL *> *)imagesURL flagImage:(NSURL *)flagImageURL;

@end
