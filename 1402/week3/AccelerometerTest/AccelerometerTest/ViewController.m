//
//  ViewController.m
//  AccelerometerTest
//
//  Created by Wesley Seago on 2/17/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    movingView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
    if (movingView != nil)
    {
        movingView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:movingView];
    }
    
    motionManager = [[CMMotionManager alloc] init];
    motionManager.accelerometerUpdateInterval = 1.0/30.0;
    [motionManager startAccelerometerUpdates];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f/30.0f target:self selector:@selector(update) userInfo:nil repeats:TRUE];
}

- (void)update
{
    if (motionManager != nil)
    {
        CMAccelerometerData *data = motionManager.accelerometerData;
        if (data != nil)
        {
            movingView.frame = CGRectMake(movingView.frame.origin.x + (data.acceleration.x * 3.0f),
                                          movingView.frame.origin.y + (data.acceleration.y * -3.0f),
                                          movingView.frame.size.width,
                                          movingView.frame.size.height);
        }
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
