//
//  CountryTableViewController.h
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 28.11.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"
#import "Repository.h"

@interface CountryTableViewController : UITableViewController
@property (nonatomic, strong, readonly) NSMutableArray<Country *> *countries;
@end
