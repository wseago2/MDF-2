//
//  pictureViewController.m
//  Project3
//
//  Created by Wesley Seago on 2/17/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "pictureViewController.h"

@interface pictureViewController ()

@end

@implementation pictureViewController

@synthesize imageData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // NSLog(@"%@", imageData);

    // create variables for images from dictionary
    UIImage *originalImage = [imageData objectForKey:@"UIImagePickerControllerOriginalImage"];
    UIImage *changedImage = [imageData objectForKey:@"UIImagePickerControllerEditedImage"];
    
    // send to outlets
    photoImageView.image = originalImage;
    scaledImageView.image = changedImage;
 
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// save button method
-(IBAction)onSave:(id)sender
{
    // original image
    UIImage *originalImage = [imageData objectForKey:@"UIImagePickerControllerOriginalImage"];
    UIImageWriteToSavedPhotosAlbum(originalImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    // changed image
    UIImage *changedImage = [imageData objectForKey:@"UIImagePickerControllerEditedImage"];
    UIImageWriteToSavedPhotosAlbum(changedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    // setup alert
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved" message:@"Both images were saved\n to the photo album." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

// cancel button method
-(IBAction)onCancel:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancel" message:@"Images will be discarded." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

// didFinishSaving method
-(void)image: (UIImage *)image
        didFinishSavingWithError: (NSError *)error
        contextInfo: (void *) contextInfo
{
    if (error != nil)
    {
        NSLog(@"%@", [error description]);
    }
    else
    {
        NSLog(@"Images Were Saved!");
    }
}

// method to allow alert views to dismiss view controller [stack overflow]
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (![self.presentedViewController isBeingDismissed])
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
