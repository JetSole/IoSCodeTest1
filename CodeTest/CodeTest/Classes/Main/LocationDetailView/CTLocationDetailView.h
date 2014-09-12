//
//  CTLocationDetailView.h
//  CodeTest
//
//  Created by User on 9/12/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTLocation.h"

@interface CTLocationDetailView : UIView

@property (nonatomic, weak) IBOutlet UILabel *lblAddress;
@property (nonatomic, weak) IBOutlet UILabel *lblPhone;
@property (nonatomic, weak) IBOutlet UILabel *lblEmail;

- (void)setLocation:(CTLocation *)location;

@end
