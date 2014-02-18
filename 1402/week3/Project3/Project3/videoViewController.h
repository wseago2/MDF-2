//
//  videoViewController.h
//  Project3
//
//  Created by Wesley Seago on 2/17/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface videoViewController : UIViewController <UIAlertViewDelegate>
{
    NSString *moviePath;
}

-(IBAction)onSave:(id)sender;
-(IBAction)onCancel:(id)sender;

@property (nonatomic, strong)NSString *moviePath;

@end
