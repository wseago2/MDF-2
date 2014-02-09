//
//  DetailViewController.m
//  ProjectOne
//
//  Created by Wesley Seago on 2/6/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize tweetDictionary;


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
    NSString *detailDateTime = [tweetDictionary valueForKey:@"created_at"];
    NSString *detailUser = [[tweetDictionary valueForKey:@"user"] objectForKey:@"name"];
    
    tweetText.text = detailText;
    tweetDateTime.text = detailDateTime;
    tweetUser.text = detailUser;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onDone:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
