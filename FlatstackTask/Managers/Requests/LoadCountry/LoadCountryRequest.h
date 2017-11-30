//
//  LoadCountryRequest.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 30.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"

@interface LoadCountryRequest : NSObject <Request>
- (instancetype) initWithEndPoint:(NSString *)endPoint;
@end
