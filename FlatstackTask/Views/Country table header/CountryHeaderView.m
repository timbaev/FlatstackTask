//
//  CountryHeaderView.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 12.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "CountryHeaderView.h"
@interface CountryHeaderView()
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@end

@implementation CountryHeaderView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:[[[NSBundle mainBundle] loadNibNamed:@"CountryHeaderTable" owner:self options:nil] objectAtIndex:0]];
        self.countryLabel.text = title;
    }
    
    return self;
}

@end
