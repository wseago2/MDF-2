//
//  videoViewController.m
//  Project3
//
//  Created by Wesley Seago on 2/17/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "videoViewController.h"

@interface videoViewController ()

@end

@implementation videoViewController

@synthesize moviePath;

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
   
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onSave:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saved" message:@"The video was saved\n to the album." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    UISaveVideoAtPathToSavedPhotosAlbum(moviePath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    
    [alert show];
}

-(IBAction)onCancel:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cancel" message:@"Video will be discarded." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)video:(NSString *)moviePath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error != nil)
    {
        NSLog(@"%@", [error description]);
    }
    else
    {
        NSLog(@"Video Was Saved!");
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
