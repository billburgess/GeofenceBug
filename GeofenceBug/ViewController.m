//
//  ViewController.m
//  GeofenceBug
//
//  Created by Bill Burgess on 10/8/12.
//  Copyright (c) 2012 Bill Burgess. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)updateTextView:(NSNotification *)notif {
    NSString *text = [notif.userInfo objectForKey:@"text"];
    NSString *existingText = _myTextView.text;
    _myTextView.text = [NSString stringWithFormat:@"%@\n%@", existingText, text];
}

- (void)viewDidLoad
{
    // register for notifications on our delegate calls
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTextView:) name:@"GeofenceBugDidEnterRegion" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTextView:) name:@"GeofenceBugDidExitRegion" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTextView:) name:@"GeofenceBugDidStartMonitoringForRegion" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTextView:) name:@"GeofenceBugMonitoringDidFailForRegion" object:nil];
    
    // clear our textView text
    _myTextView.text = @"";
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // this app will start out by removing the old fence from monitoring and add it back new

    LocationManagerController *locationController = [LocationManagerController sharedManager];
    NSArray *regionSet = [[locationController.locationManager monitoredRegions] allObjects];
    
    for (CLRegion *region in regionSet) {
        [locationController.locationManager stopMonitoringForRegion:region];
    }
    
    // add our region to be monitored, hardcoded for testing purposes
    CLLocationCoordinate2D coord;
    coord.latitude = 46.898264;
    coord.longitude = -96.783403;
    CLLocationDistance radius = 100;
    
    CLRegion *fenceRegion = [[CLRegion alloc] initCircularRegionWithCenter:coord radius:radius identifier:@"GeofenceBugFence"];
    [locationController.locationManager startMonitoringForRegion:fenceRegion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - IBActions

-(IBAction)clearAction:(id)sender {
    _myTextView.text = @"";
}

@end
