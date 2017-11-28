//
//  Country.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 28.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Country : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *continent;
@property (nonatomic, strong) NSString *capital;
@property (nonatomic) NSUInteger population;
@property (nonatomic, strong) NSString *shortDescription;
@property (nonatomic, strong) NSString *fullDescription;
@property (nonatomic, strong) NSMutableArray<UIImage *> *images;
@property (nonatomic, strong) UIImage *flagImage;

- (id)initWithName:(NSString *)name continent:(NSString *)contentent capital:(NSString *)capital population:(NSUInteger)population shortDescription:(NSString *)shortDescription fullDescription:(NSString *)fullDescription images:(NSMutableArray<UIImage *> *)images flagImage:(UIImage *)flagImage;

@end
