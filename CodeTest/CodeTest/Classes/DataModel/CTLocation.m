//
//  CTLocation.m
//  CodeTest
//
//  Created by User on 9/12/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "CTLocation.h"

@implementation CTLocation

+ (NSArray *)defaultLocations
{
    CTLocation *location1 = [[CTLocation alloc] init];
    CTLocation *location2 = [[CTLocation alloc] init];
    CTLocation *location3 = [[CTLocation alloc] init];

    location1.name = @"El Tapatio";
    location1.address = @"13720 Factoria Blvd SE\nBellevue\n98006 WA\nUnited States";
    location1.location = [[CLLocation alloc] initWithLatitude:47.577284 longitude:-122.168546];
    location1.phone = @"1 425 3730855";
    location1.email = @"eltapatio@yelp.com";

    location2.name = @"Bai Tong";
    location2.address = @"14804 NE 24th St\nRedmond\n98052 WA\nUnited States";
    location2.location = [[CLLocation alloc] initWithLatitude:47.63184 longitude:-122.141724];
    location2.phone = @"1 425 7478424";
    location2.email = @"baitong@yelp.com";

    location3.name = @"Wild Ginger";
    location3.address = @"1401 3rd Ave\nSeattle\n98104 WA\nUnited States";
    location3.location = [[CLLocation alloc] initWithLatitude:47.60887 longitude:-122.337375];
    location3.phone = @"1 206 6234450";
    location3.email = @"eltapatio@yelp.com";

    return @[location1, location2, location3];
}

@end
