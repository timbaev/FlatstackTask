//
//  CountryTableViewCell.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 28.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"

@interface CountryTableViewCell : UITableViewCell
- (void) prepareCellWithCountry:(Country *)country;
@end
