//
//  RecureMe.h
//  Rescue Me
//
//  Created by Ahmad Samra on 12/12/13.
//  Copyright (c) 2013 Ahmad Samra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol CoreLocationControllerDelegate
@required
- (void)locationUpdate:(CLLocation *)location; // Our location updates are sent here
- (void)locationError:(NSError *)error; // Any errors are sent here
@end

@interface RescueMe : NSObject<CLLocationManagerDelegate> {
	CLLocationManager *locMgr;
    id __unsafe_unretained delegate;
}

@property (nonatomic, retain) CLLocationManager *locMgr;
@property (nonatomic, assign) id delegate;


@end
