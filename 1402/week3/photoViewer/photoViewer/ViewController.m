//
//  ViewController.m
//  photoViewer
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

-(IBAction)onClick:(id)sender
{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    if (pickerController != nil)
    {
        pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        pickerController.delegate = self;
        
        pickerController.allowsEditing = YES;
        
        [self presentViewController:pickerController animated:YES completion:nil];
    }
}

// user selected image
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
{
    NSLog(@"%@", [info description]);
    
    UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    if (selectedImage != nil)
    {
        photoImageView.image = selectedImage;
    }
    
    UIImage *scaledImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (scaledImage != nil)
    {
        scaledImageView.image = scaledImage;
        
        UIImageWriteToSavedPhotosAlbum(scaledImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)image: (UIImage *)image
        didFinishSavingWithError: (NSError *)error
        contextInfo: (void *) contextInfo
{
    if (error != nil)
    {
        NSLog (@"%@", [error description]);
    }
    else
    {
        NSLog(@"Edited Image Was Saved!");
    }
}

// user cancelled
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
