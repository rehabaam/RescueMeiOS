//
//  RecureMe.m
//  Rescue Me
//
//  Created by Ahmad Samra on 12/12/13.
//  Copyright (c) 2013 Ahmad Samra. All rights reserved.
//

#import "RescueMe.h"

@implementation RescueMe


CLLocationManager *clLocationManager;

@synthesize delegate;

/* Singleton */
static RescueMe *sharedSingleton;

/* Singleton */
+ (id)sharedManager
{
    static RescueMe *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        clLocationManager = [[CLLocationManager alloc] init];
    });
    return sharedMyManager;
}

#pragma mark - Public functions

- (void)start {
    
    [clLocationManager setDelegate:(id<CLLocationManagerDelegate>)self]; //If I put this         [clLocationManager setDesiredAccuracy:kCLLocationAccuracyBest]; // and this in initialize, it doesn't work anymore.
    CLLocationManager *manager = clLocationManager;
    if ([manager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [manager startUpdatingLocation];
    } else {
        [manager requestAlwaysAuthorization];
    }
}

- (void)stop {
    [clLocationManager stopUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        [delegate isLocationManagerDelegateTriggered:currentLocation];
    }
}

@end