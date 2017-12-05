//
//  CountryDetailsViewController.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 05.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"

@interface CountryDetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) Country *country;
@end
