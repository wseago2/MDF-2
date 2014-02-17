//
//  ViewController.h
//  photoViewer
//
//  Created by Wesley Seago on 2/17/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    IBOutlet UIImageView *photoImageView;
    IBOutlet UIImageView *scaledImageView;
}

-(IBAction)onClick:(id)sender;

@end
