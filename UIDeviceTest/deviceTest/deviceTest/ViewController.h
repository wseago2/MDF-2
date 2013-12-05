//
//  ViewController.h
//  deviceTest
//
//  Created by Wesley Seago on 12/5/13.
//  Copyright (c) 2013 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *name;
    IBOutlet UILabel *model;
    IBOutlet UILabel *os;
    IBOutlet UILabel *version;

}

@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *model;
@property (nonatomic, strong) UILabel *os;
@property (nonatomic, strong) UILabel *version;


@end
