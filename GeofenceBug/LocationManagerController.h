//
//  LocationManagerController.h
//  Simple In Out
//
//  Created by William Burgess on 8/23/11.
//  Copyright (c) 2011 Simply Made Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol LocationManagerControllerDelegate
@required
-(void)enterFence:(CLRegion *)region;
-(void)exitFence:(CLRegion *)region;
-(void)fenceError:(NSError *)error;
@end

@interface LocationManagerController : NSObject <CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) id delegate;

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region;
-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region;
-(void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error;

+(id)sharedManager;

@end

