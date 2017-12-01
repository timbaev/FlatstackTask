//
//  CountryTableViewCell.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 28.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "CountryTableViewCell.h"
#import "ImageDownloader.h"

@interface CountryTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *capitalLabel;
@property (weak, nonatomic) IBOutlet UILabel *shortDescriptionLabel;
@end

@implementation CountryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void) prepareCellWithCountry:(Country *)country {
    //self.flagImageView.image = country.flagImage;
    self.countryLabel.text = country.name;
    self.capitalLabel.text = country.capital;
    self.shortDescriptionLabel.text = country.shortDescription;
    
    __weak CountryTableViewCell *weakSelf = self;
    [ImageDownloader downloadFrom:country.flagImageURL completionBlock:^(UIImage *image) {
        if (image != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.flagImageView.image = image;
            });
        }
    }];
}

@end
