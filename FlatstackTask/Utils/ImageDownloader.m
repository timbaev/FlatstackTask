//
//  ImageDownloader.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 30.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "ImageDownloader.h"

@implementation ImageDownloader
+ (void)downloadFrom:(NSURL *)url completionBlock:(completionBlock)completionBlock {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        if (data == nil) {
            completionBlock(nil);
            return;
        }
        completionBlock([UIImage imageWithData:data]);
    });
}
@end
