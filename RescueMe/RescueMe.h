//
//  RecureMe.h
//  Rescue Me
//
//  Created by Ahmad Samra on 12/12/13.
//  Copyright (c) 2013 Ahmad Samra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class RescueMe;

@protocol LocationManagerDelegate

@required
-(void)isLocationManagerDelegateTriggered:(CLLocation *) location;
@end

@interface RescueMe : NSObject <CLLocationManagerDelegate>

+ (id)sharedManager;
-(void)start;
- (void)stop;
//- (double) getDistanceToLocationInKM:(CLLocation *) location currentLocation:(CLLocation *)currentlocation;

@property (nonatomic, assign) id  delegate;

@end