//
//  DetailViewController.m
//  baseProject
//
//  Created by Wesley Seago on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "UserDetailsViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize tweetDictionary;
@synthesize currentUser;
@synthesize tweetText;
@synthesize tweetUser;
@synthesize tweetDateTime;
@synthesize tweetImage;

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
    NSString *detailText = [tweetDictionary objectForKey:@"text"];
    NSString *detailUser = [[tweetDictionary valueForKey:@"user"] objectForKey:@"name"];
    NSString *detailDateTime = [tweetDictionary valueForKey:@"created_at"];
    NSString *detailImage = [[tweetDictionary objectForKey:@"user"] objectForKey:@"profile_image_url"];
    
    NSURL *url = [NSURL URLWithString:detailImage];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    tweetText.text = detailText;
    tweetUser.text = detailUser;
    tweetDateTime.text = detailDateTime;
    tweetImage.image = [UIImage imageWithData:data];
    
//    NSLog(@"%@", tweetText);
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onUser:(id)sender
{
    UserDetailsViewController *viewController = [[UserDetailsViewController alloc] initWithNibName:@"UserDetailsViewController" bundle:nil];
    if (viewController != nil)
    {
//        NSLog(@"%@", tweetDictionary);
        
        viewController.tweetDictionary = tweetDictionary;
        
        [self presentViewController:viewController animated:YES completion:nil];
    }
}

@end
