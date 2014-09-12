//
//  CTMainViewController.h
//  CodeTest
//
//  Created by User on 9/12/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "CTBaseViewController.h"
#import "CTMainButtonsTab.h"
#import "CTLocationDetailView.h"
#import <MapKit/MapKit.h>

@interface CTMainViewController : CTBaseViewController

@property (nonatomic, weak) IBOutlet CTMainButtonsTab *buttonsTab;
@property (nonatomic, weak) IBOutlet UITextField *tfSearchName;
@property (nonatomic, weak) IBOutlet UITextField *tfSearchLocation;
@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, weak) IBOutlet CTLocationDetailView *locationDetailView;

- (IBAction)actionGetDirection;
- (IBAction)actionShareLocation;
- (IBAction)actionCallPhone;

@end
