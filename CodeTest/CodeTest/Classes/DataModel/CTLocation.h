//
//  CTLocation.h
//  CodeTest
//
//  Created by User on 9/12/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CTLocation : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *email;

+ (NSArray *)defaultLocations;

@end
