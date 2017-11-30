//
//  Request.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 30.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Request <NSObject>
@property (nonatomic, strong, readonly) NSString *httpMethod;
@property (nonatomic, strong) NSString *headers;
@property (nonatomic, strong) NSString *endPoint;
@end
