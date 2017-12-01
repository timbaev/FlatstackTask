//
//  LoadCountryRequest.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 30.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "LoadCountryRequest.h"

@implementation LoadCountryRequest

@synthesize endPoint;
@synthesize headers;

- (NSString *)httpMethod {
    return @"GET";
}


- (instancetype) initWithEndPoint:(NSString *)endPoint {
    self = [super init];
    
    if (self) {
        self.endPoint = endPoint;
    }
    
    return self;
}


@end
