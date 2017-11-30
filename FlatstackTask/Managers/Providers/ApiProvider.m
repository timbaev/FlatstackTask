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

//NSString *const GetAllCountriesURL = @"https://rawgit.com/NikitaAsabin/799e4502c9fc3e0ea7af439b2dfd88fa/raw/145611f98d4ef72b758966f00b25552a78437212/page1.json";
//
//-(void)getAllCountries {
//    NSString *urlAsString = [NSString stringWithString:GetAllCountriesURL];
//    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
//    NSLog(@"%@", urlAsString);
//
//    NSURLSession *session = [NSURLSession sharedSession];
//    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (error) {
//            [self.delegate fetchingCountriesFailedWithError:error];
//        } else {
//            [self.delegate receivedCountriesJSON:data];
//        }
//    }] resume];
//}

@end
