//
//  CTLocationDetailView.m
//  CodeTest
//
//  Created by User on 9/12/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "CTLocationDetailView.h"

@implementation CTLocationDetailView

- (void)setLocation:(CTLocation *)location
{
    [self.lblAddress setText:location.address];
    [self.lblPhone setText:(location.phone == nil) ? @"" : [NSString stringWithFormat:@"+%@", location.phone]];
    [self.lblEmail setText:location.email];
}

@end
