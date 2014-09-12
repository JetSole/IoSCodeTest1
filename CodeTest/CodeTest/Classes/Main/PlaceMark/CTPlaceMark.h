//
//  CTPlaceMark.h
//  CodeTest
//
//  Created by User on 9/13/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "CTLocation.h"

@interface CTPlaceMark : NSObject

@property (nonatomic, strong) CTLocation *location;

+ (id)placeMarkWithLocation:(CTLocation *)location;
- (id)initWithLocation:(CTLocation *)location;

@end
