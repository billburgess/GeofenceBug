//
//  LocationManagerController.m
//  Simple In Out
//
//  Created by William Burgess on 8/23/11.
//  Copyright (c) 2011 Simply Made Apps. All rights reserved.
//

#import "LocationManagerController.h"

//static LocationManagerController *sharedMyManager = nil;

@implementation LocationManagerController

+(id)sharedManager {
    
    static LocationManagerController *_sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedManager = [[self alloc] init];
    });
    
    return _sharedManager;

}

-(id) init {
    if (self = [super init]) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = kCLLocationAccuracyBest;
    }
    return self;
}

+(void)clearLocationManagerController {
    static LocationManagerController *_sharedManager = nil;
}

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"didEnterRegion:");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GeofenceBugDidEnterRegion" object:nil userInfo:@{@"text" : @"didEnterRegion"}];
    
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"didExitRegion:");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GeofenceBugDidExitRegion" object:nil userInfo:@{@"text" : @"didExitRegion"}];
}

-(void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    // should fire when region was added successfully
    NSLog(@"Region added ok");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GeofenceBugDidStartMonitoringForRegion" object:nil userInfo:@{@"text" : @"didStartMonitoringForRegion"}];
}

-(void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error {
    // this method is called when the region can't be added
    // could be error or just too many fences on device
    NSLog(@"monitoringDidFailForRegion");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"GeofenceBugMonitoringDidFailForRegion" object:nil userInfo:@{@"text" : @"monitoringDidFailForRegion"}];
}

@end
