//
//  CTMainViewController.m
//  CodeTest
//
//  Created by User on 9/12/14.
//  Copyright (c) 2014 Ibrahim. All rights reserved.
//

#import "CTMainViewController.h"
#import "CTPlaceMark.h"

@interface CTMainViewController () <CTMainButtonsTabDelegate, UITextFieldDelegate, MKMapViewDelegate> {

    NSArray *_allLocations;
}

@property (nonatomic, strong) NSArray *filteredLocations;
@property (nonatomic, strong) CTLocation *selectedLocation;

@end

@implementation CTMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _allLocations = [CTLocation defaultLocations];
    self.filteredLocations = _allLocations;

    self.selectedLocation = nil;
}

- (void)searchWithName:(NSString *)name
{
    if (name == nil) {

        return;
    }

    self.selectedLocation = nil;

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains [cd] %@", name];
    self.filteredLocations = [self.filteredLocations filteredArrayUsingPredicate:predicate];
}

- (void)searchWithLocation:(NSString *)location
{
    if (location == nil) {

        return;
    }

    self.selectedLocation = nil;

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.address contains [cd] %@", location];
    self.filteredLocations = [self.filteredLocations filteredArrayUsingPredicate:predicate];
}

- (void)updatePins
{
    [self.mapView removeAnnotations:self.mapView.annotations];

    MKMapRect mapRect = MKMapRectNull;
    for (CTLocation *location in self.filteredLocations) {

        [self.mapView addAnnotation:[CTPlaceMark placeMarkWithLocation:location]];

        MKMapPoint point = MKMapPointForCoordinate(location.location.coordinate);
        MKMapRect newRect = MKMapRectMake(point.x, point.y, 100.0f, 100.0f);
        mapRect = MKMapRectIsNull(mapRect) ? newRect : MKMapRectUnion(mapRect, newRect);
    }

    [self.mapView setRegion:MKCoordinateRegionForMapRect(mapRect)];
}

#pragma mark -
#pragma mark getter/ setter methods
- (void)setFilteredLocations:(NSArray *)filteredLocations
{
    _filteredLocations = filteredLocations;
    [self updatePins];
}

- (void)setSelectedLocation:(CTLocation *)selectedLocation
{
    _selectedLocation = selectedLocation;
    [self.locationDetailView setLocation:selectedLocation];
}

#pragma mark -
#pragma mark user interaction methods
- (void)actionGetDirection
{
    if (self.selectedLocation == nil) {

        return;
    }

    CLLocationCoordinate2D location = self.selectedLocation.location.coordinate;
    MKPlacemark *placeMark = [[MKPlacemark alloc] initWithCoordinate:CLLocationCoordinate2DMake(location.latitude, location.longitude) addressDictionary:nil];
    MKMapItem *destination =  [[MKMapItem alloc] initWithPlacemark:placeMark];

    if([destination respondsToSelector:@selector(openInMapsWithLaunchOptions:)]) {

        [destination openInMapsWithLaunchOptions:@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving}];
    }
    else {

        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com/?q=%@", self.selectedLocation.address]]];
    }
}

- (void)actionShareLocation
{
    if (self.selectedLocation == nil) {

        return;
    }

    NSString *text = [NSString stringWithFormat:@"Current Location: %@", self.selectedLocation.address];

    NSArray *objectsToShare = @[text];

    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];

    activityController.completionHandler = ^(NSString *activityType, BOOL completed) {

        [self dismissViewControllerAnimated:YES completion:nil];
    };

    [self presentViewController:activityController animated:YES completion:nil];
}

- (void)actionCallPhone
{
    if (self.selectedLocation == nil) {

        return;
    }

    NSString *actualNumber = self.selectedLocation.phone;
    actualNumber = [actualNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *phoneNumber = [NSString stringWithFormat:@"telprompt://%@", actualNumber];

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}

#pragma mark -
#pragma mark MKMapViewDelegate methods
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    CTPlaceMark *placeMark = (CTPlaceMark *)view.annotation;
    self.selectedLocation = placeMark.location;
}

#pragma mark -
#pragma mark UITextFieldDelegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSString *searchText = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (textField == self.tfSearchName) {

        [self searchWithName:searchText];
    }
    else if (textField == self.tfSearchLocation) {

        [self searchWithLocation:searchText];
    }

    return YES;
}

#pragma mark -
#pragma mark CTMainButtonsTabDelegate methods
- (void)didSelectTabItemAtIndex:(NSInteger)index
{
    //
}

@end
