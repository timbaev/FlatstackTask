//
//  CountryImagesCollectionViewCell.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 01.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "CountryImagesCollectionViewCell.h"

@interface CountryImagesCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@end

@implementation CountryImagesCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)prepareCellWithImage:(UIImage *)image {
    self.photoImageView.image = image;
}

@end
