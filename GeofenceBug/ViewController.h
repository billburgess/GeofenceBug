//
//  ViewController.h
//  GeofenceBug
//
//  Created by Bill Burgess on 10/8/12.
//  Copyright (c) 2012 Bill Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationManagerController.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextView *myTextView;
@property (nonatomic, strong) IBOutlet UIButton *clearButton;

-(IBAction)clearAction:(id)sender;

@end
