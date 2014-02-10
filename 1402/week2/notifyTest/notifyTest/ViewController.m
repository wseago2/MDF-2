//
//  ViewController.m
//  notifyTest
//
//  Created by Wesley Seago on 2/9/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    // cancel all scheduled notifications
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    NSDate *notifyDate = [[NSDate date] dateByAddingTimeInterval:10];
    
    UILocalNotification *myLocalNotification = [[UILocalNotification alloc] init];
    if (myLocalNotification != nil)
    {
        myLocalNotification.fireDate = notifyDate;
        myLocalNotification.timeZone = [NSTimeZone localTimeZone];
        myLocalNotification.alertBody = @"Zombies are coming!";
        myLocalNotification.alertAction = @"Run!";
        
        [[UIApplication sharedApplication] scheduleLocalNotification:myLocalNotification];
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
