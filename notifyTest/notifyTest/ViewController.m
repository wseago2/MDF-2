//
//  ViewController.m
//  notifyTest
//
//  Created by Wesley Seago on 12/5/13.
//  Copyright (c) 2013 Wesley Seago. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    NSDate *notifyDate = [[NSDate date] dateByAddingTimeInterval:10];
    
    UILocalNotification *myNotification = [[UILocalNotification alloc] init];
    if (myNotification != nil)
    {
        myNotification.fireDate = notifyDate;
        myNotification.timeZone = [NSTimeZone localTimeZone];
        myNotification.alertBody = @"Zombies are coming!";
        myNotification.alertAction = @"Run!";
        
        [[UIApplication sharedApplication] scheduleLocalNotification:myNotification];
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
