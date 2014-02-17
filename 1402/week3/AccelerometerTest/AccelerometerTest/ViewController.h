//
//  ViewController.h
//  AccelerometerTest
//
//  Created by Wesley Seago on 2/17/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController
{
    UIView *movingView;
    CMMotionManager *motionManager;
    NSTimer *timer;
}

@end
