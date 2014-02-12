//
//  DetailViewController.h
//  ProjectTwo
//
//  Created by Wesley Seago on 2/10/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FollowerData.h"
#import "ViewController.h"

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel *textLabel;
    IBOutlet UIImageView *cellImageView;
    
    
}

@property (nonatomic, strong)UILabel *textLabel;
@property (nonatomic, strong)UIImageView *cellImageView;
@property (nonatomic, strong)NSDictionary *sharedDetail;

-(IBAction)onDone:(id)sender;

@end
