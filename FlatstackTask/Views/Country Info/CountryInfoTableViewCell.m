//
//  CountryInfoTableViewCell.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 01.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "CountryInfoTableViewCell.h"
@interface CountryInfoTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@end

@implementation CountryInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)prepareCellWithCountry:(Country *)country row:(NSInteger)row {
    if (row == 1) {
        self.iconImageView.image = [UIImage imageNamed:@"star"];
        self.infoLabel.text = @"Capital";
        self.valueLabel.text = country.capital;
    }
    if (row == 2) {
        self.iconImageView.image = [UIImage imageNamed:@"face"];
        self.infoLabel.text = @"Population";
        self.valueLabel.text = [NSString stringWithFormat:@"%ld", (long)country.population];
    }
    if (row == 3) {
        self.iconImageView.image = [UIImage imageNamed:@"earth"];
        self.infoLabel.text = @"Continent";
        self.valueLabel.text = country.continent;
    }
}

@end
