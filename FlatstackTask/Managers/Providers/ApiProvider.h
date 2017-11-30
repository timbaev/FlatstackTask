//
//  ApiProvider.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 30.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"


@interface ApiProvider : NSObject
typedef void(^resultBlock)(NSData*);
- (void)makeRequest:(id <Request>)request completionBlock:(resultBlock)completionBlock;
- (instancetype)initWithBaseUrl:(NSString *)baseUrl;
@end
