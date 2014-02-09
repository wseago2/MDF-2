//
//  ViewController.m
//  deviceTest
//
//  Created by Wesley Seago on 2/9/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize devicename;
@synthesize systemversion;

- (void)viewDidLoad
{
    UIDevice *thisDevice = [UIDevice currentDevice];
    if (thisDevice != nil)
    {
        NSLog(@"Name: %@", thisDevice.name);
        deviceName.text = thisDevice.name;
        systemVersion.text = thisDevice.systemVersion;
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
