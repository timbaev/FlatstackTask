//
//  CountryManagerDelegate.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 28.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Country.h"

@protocol CountryManagerDelegate
- (void)didReceiveCountries:(NSArray<Country *> *)countries;
- (void)fetchingCountriesFailedWithError:(NSError *)error;
@end
