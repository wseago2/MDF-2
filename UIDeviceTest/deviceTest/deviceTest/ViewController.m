//
//  ViewController.m
//  deviceTest
//
//  Created by Wesley Seago on 12/5/13.
//  Copyright (c) 2013 Wesley Seago. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize name;
@synthesize model;
@synthesize os;
@synthesize version;

- (void)viewDidLoad
{
    UIDevice *myDevice = [UIDevice currentDevice];
    if (myDevice != nil)
    {
        NSLog(@"system device: %@", myDevice.name);
        name.text = myDevice.name;
        NSLog(@"Model of Device: %@", myDevice.model);
        model.text = myDevice.model;
        NSLog(@"Device OS: %@", myDevice.systemName);
        os.text = myDevice.systemName;
        NSLog(@"Device OS Version: %@", myDevice.systemVersion);
        version.text = myDevice.systemVersion;
        myDevice.batteryMonitoringEnabled = YES;
        NSLog(@"Current Battery Level is: %f", myDevice.batteryLevel);
        
        switch (myDevice.batteryState)
        {
            case 0:
                NSLog(@"Battery State is Unknown");
                break;
            case 1:
                NSLog(@"Battery State is Unplugged");
                break;
            case 2:
                NSLog(@"Battery State is Charging");
                break;
            case 3:
                NSLog(@"Battery State is Fully Charged");
                break;
        }
        NSLog(@"Battery State is: %d", myDevice.batteryState);
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
