//
//  CountryCommunicatorDelegate.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 28.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CountryCommunicatorDelegate
- (void)receivedCountriesJSON:(NSData *)objectNotation;
- (void)fetchingCountriesFailedWithError:(NSError *)error;
@end
