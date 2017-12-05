//
//  CountryInfoTableViewCell.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 01.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"

@interface CountryInfoTableViewCell : UITableViewCell
- (void)prepareCellWithCountry:(Country*)country row:(NSInteger)row;
@end
