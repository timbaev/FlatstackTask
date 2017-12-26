//
//  ApiProvider.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 30.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "ApiProvider.h"
@interface ApiProvider()
@property (nonatomic, strong) NSString *baseUrl;
@end

@implementation ApiProvider

- (instancetype) initWithBaseUrl:(NSString *)baseUrl {
    self = [super init];
    
    if (self) {
        self.baseUrl = baseUrl;
    }
    
    return self;
}

- (void)makeRequest:(id<Request>)request completionBlock:(resultBlock)completionBlock {
    NSString *urlAsString = [self.baseUrl stringByAppendingPathComponent:request.endPoint];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) completionBlock(nil);
        else completionBlock(data);
    }] resume];
}

@end
