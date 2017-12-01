//
//  ImageDownloader.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 30.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageDownloader : NSObject
typedef void(^completionBlock)(UIImage*);
+ (void)downloadFrom:(NSURL *)url completionBlock:(completionBlock)completionBlock;
@end
