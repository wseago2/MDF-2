//
//  ViewController.m
//  Project3
//
//  Created by Wesley Seago on 2/17/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "ViewController.h"
#import "pictureViewController.h"
#import "videoViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

// image capture selected
-(IBAction)onPicture:(id)sender
{
    UIImagePickerController *pictureController = [[UIImagePickerController alloc] init];
    if (pictureController != nil)
    {
        pictureController.sourceType = UIImagePickerControllerSourceTypeCamera;
        pictureController.delegate = self;
        pictureController.allowsEditing = YES;
        [self presentViewController:pictureController animated:YES completion:nil];
    }
}

// video capture selected
-(IBAction)onVideo:(id)sender
{
    UIImagePickerController *videoController = [[UIImagePickerController alloc] init];
    if (videoController != nil)
    {
        videoController.sourceType = UIImagePickerControllerCameraCaptureModeVideo;
        videoController.delegate = self;
        videoController.allowsEditing = NO;
        videoController.videoQuality = UIImagePickerControllerQualityTypeMedium;
        videoController.mediaTypes = [NSArray arrayWithObjects:(NSString*) kUTTypeMovie, nil];
        [self presentViewController:videoController animated:YES completion:nil];
    }
}

// show album selected
-(IBAction)onAlbum:(id)sender
{
    UIImagePickerController *albumController = [[UIImagePickerController alloc] init];
    if (albumController != nil)
    {
        albumController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        albumController.delegate = self;
        albumController.allowsEditing = YES;
        albumController.mediaTypes = [NSArray arrayWithObjects:(NSString*)kUTTypeImage, (NSString*)kUTTypeMovie, nil];
        [self presentViewController:albumController animated:YES completion:nil];
    }
}

// didFinishPickingMediaWithInfo method
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (![self.presentedViewController isBeingDismissed])
    {
        [self dismissViewControllerAnimated:YES completion:^{
    
        // handle camera first
        pictureViewController *pictureView = [[pictureViewController alloc] initWithNibName:@"pictureViewController" bundle:nil];
        
        UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        if (selectedImage != nil)
        {
            // pass data to pictureView
            pictureView.imageData = info;
            
            // present pictureViewController
            [self presentViewController:pictureView animated:YES completion:nil];
            
        }
        
        // handle video next
        [self dismissViewControllerAnimated:YES completion:nil];
        
        videoViewController *videoView = [[videoViewController alloc] initWithNibName:@"videoViewController" bundle:nil];
        
        NSURL *urlString = [info valueForKey:UIImagePickerControllerMediaURL];
        NSString *videoPath = [urlString path];
        videoView.moviePath = videoPath;
            
        [self presentViewController:videoView animated:YES completion:nil];
            
    }];
    }
}

// user selects cancel
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"You cancelled request.");
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
