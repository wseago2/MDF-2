//
//  UserDetailsViewController.m
//  ProjectOne
//
//  Created by Wesley Seago on 2/6/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "UserDetailsViewController.h"

@interface UserDetailsViewController ()

@end

@implementation UserDetailsViewController

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
    NSString *detailsUser = [[tweetDictionary valueForKey:@"user"] objectForKey:@"name"];
    NSString *detailsDescription = [[tweetDictionary valueForKey:@"user"] objectForKey:@"description"];
    NSString *detailsFollowers = [[NSString alloc] initWithFormat:@"%@", [[tweetDictionary valueForKey:@"user"] objectForKey:@"followers_count"]];
    NSString *detailsFriends = [[NSString alloc] initWithFormat:@"%@", [[tweetDictionary valueForKey:@"user"] objectForKey:@"friends_count"]];
    
    detailUser.text = detailsUser;
    detailDescription.text = detailsDescription;
    detailFollowers.text = detailsFollowers;
    detailFriends.text = detailsFriends;
    
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
