//
//  ViewController.h
//  Project3
//
//  Created by Wesley Seago on 2/17/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    
}

-(IBAction)onPicture:(id)sender;
-(IBAction)onVideo:(id)sender;
-(IBAction)onAlbum:(id)sender;

@end
