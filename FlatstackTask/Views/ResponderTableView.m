//
//  ResponderTableView.m
//  FlatstackTask
//
//  Created by Тимур Шафигуллин on 08.12.2017.
//  Copyright © 2017 Flatstack. All rights reserved.
//

#import "ResponderTableView.h"

@implementation ResponderTableView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return !(point.y <= 0 && point.y >= -self.responderHeight);
}

@end
