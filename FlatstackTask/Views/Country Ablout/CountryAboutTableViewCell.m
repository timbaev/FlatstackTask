//
//  CountryAboutTableViewCell.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 01.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "CountryAboutTableViewCell.h"

@interface CountryAboutTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@end

@implementation CountryAboutTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)prepareCellWithDescription:(NSString *)description {
    self.descriptionLabel.text = description;
}

@end
