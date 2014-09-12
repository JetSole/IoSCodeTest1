//
//  CTStandardButton.m
//  CodeTest
//
//  Created by User on 9/12/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "CTStandardButton.h"

@implementation CTStandardButton

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setBackgroundImage:[[UIImage imageNamed:@"btn_standard"] resizableImageWithCapInsets:UIEdgeInsetsMake(15.0f, 5.0f, 15.0f, 5.0f)] forState:UIControlStateNormal];
    [self setBackgroundImage:[[UIImage imageNamed:@"btn_standard_on"] resizableImageWithCapInsets:UIEdgeInsetsMake(15.0f, 5.0f, 15.0f, 5.0f)] forState:UIControlStateHighlighted];
}

@end
