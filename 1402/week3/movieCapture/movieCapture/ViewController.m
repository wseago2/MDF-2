//
//  ViewController.m
//  movieCapture
//
//  Created by Wesley Seago on 2/17/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)onCapture:(id)sender
{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    if (pickerController != nil)
    {
        pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        pickerController.delegate = self;
        
        pickerController.allowsEditing = NO;
        pickerController.videoQuality = UIImagePickerControllerQualityTypeMedium;
        pickerController.mediaTypes = [NSArray arrayWithObjects:(NSString*) kUTTypeMovie, nil];
        
        [self presentViewController:pickerController animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"%@", [info description]);
    
    NSURL *urlString = [info valueForKey:UIImagePickerControllerMediaURL];
    if (urlString != nil)
    {
        NSString *videoPath = [urlString path];
        
        UISaveVideoAtPathToSavedPhotosAlbum(videoPath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    }
}

-(void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != nil)
    {
        NSLog(@"Error Saving File");
    }
    else
    {
        NSLog(@"Movie Successfully Saved");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
