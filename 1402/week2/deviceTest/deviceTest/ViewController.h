//
//  ViewController.h
//  deviceTest
//
//  Created by Wesley Seago on 2/9/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *deviceName;
    IBOutlet UILabel *systemVersion;
}

@property (nonatomic, strong) NSString *devicename;
@property (nonatomic, strong) NSString *systemversion;

@end
