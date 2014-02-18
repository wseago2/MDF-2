//
//  pictureViewController.h
//  Project3
//
//  Created by Wesley Seago on 2/17/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pictureViewController : UIViewController <UIAlertViewDelegate>
{
    NSDictionary *imageData;
    
    IBOutlet UIImageView *photoImageView;
    IBOutlet UIImageView *scaledImageView;
}

@property (nonatomic, strong)NSDictionary *imageData;

-(IBAction)onSave:(id)sender;
-(IBAction)onCancel:(id)sender;

@end
