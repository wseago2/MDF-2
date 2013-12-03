//
//  UserDetailsViewController.m
//  baseProject
//
//  Created by Wesley Seago on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "UserDetailsViewController.h"
#import "ViewController.h"

@interface UserDetailsViewController ()

@end

@implementation UserDetailsViewController

@synthesize tweetDictionary;
@synthesize userDetailsName;
@synthesize userDetailsDescription;
@synthesize userDetailsFollowers;
@synthesize userDetailsFriends;

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
//    NSLog(@"%@", tweetDictionary);
    
    NSString *detailsName = [[tweetDictionary valueForKey:@"user"] objectForKey:@"name"];
    NSString *detailsDescription = [tweetDictionary valueForKey:@"description"];
    NSString *detailsQtyFollowers = [[NSString alloc] initWithFormat:@"%@",[[tweetDictionary valueForKey:@"user"] objectForKey:@"followers_count" ]];
    NSString *detailsQtyFriends = [[NSString alloc] initWithFormat:@"%@",[[tweetDictionary valueForKey:@"user"] objectForKey:@"friends_count" ]];
    
    userDetailsName.text = detailsName;
    userDetailsDescription.text = detailsDescription;
    userDetailsFollowers.text = detailsQtyFollowers;
    userDetailsFriends.text = detailsQtyFriends;
    
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

@end
