//
//  CTPlaceMark.m
//  CodeTest
//
//  Created by User on 9/13/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "CTPlaceMark.h"

@implementation CTPlaceMark

+ (id)placeMarkWithLocation:(CTLocation *)location
{
    return [[self alloc] initWithLocation:location];
}

- (id)initWithLocation:(CTLocation *)location
{
    self = [super init];
    if (self) {

        self.location = location;
    }

    return self;
}

- (NSString *)title
{
    return self.location.name;
}

- (CLLocationCoordinate2D)coordinate
{
    return self.location.location.coordinate;
}

@end
