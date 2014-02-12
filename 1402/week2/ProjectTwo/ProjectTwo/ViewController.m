//
//  ViewController.m
//  ProjectTwo
//
//  Created by Wesley Seago on 2/9/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "FollowerData.h"
#import "myCollectionCell.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize twitterFeed;
@synthesize followersData;
@synthesize currentFollower;

- (void)viewDidLoad
{
    // register detailViewController Nib
    
    // create account store
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil)
    {
        // create accountType and assign Twitter
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil)
        {
            // create request code block
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error)
             {
                 if (granted)
                 {
                     // create array for accounts
                     NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                     if (twitterAccounts != nil)
                    {
                        
                        ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                        if (currentAccount != nil)
                        {
                            // create request string
                            NSString *friendListString = @"https://api.twitter.com/1.1/friends/list.json?cursor=-1&skip_status=true&include_user_entities=false";
                            
                            // create SL request
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:friendListString] parameters:nil];
                            if (request != nil)
                            {
                                // set account to current account
                                [request setAccount:currentAccount];
                                
                                // perform request
                                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                                 {
                                     NSInteger responseCode = [urlResponse statusCode];
                                     if (responseCode == 200)
                                     {
                                         twitterFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                         if (twitterFeed != nil)
                                         {
                                             //NSLog(@"%@",twitterFeed);
                                             
                                             // refresh collection view here
                                             [myCollectionView reloadData];
                                             
                                             // put user data into an array
                                             followersArray = [twitterFeed objectForKey:@"users"];
                                             //NSLog(@"%@", followersArray);
                                             
                                             // create mutable array to hold custom objects
                                             followersData = [[NSMutableArray alloc] init];
                                             
                                             // loop through followersArray
                                             for (int i=0; i<[followersArray count]; i++)
                                             {
                                                 // get names
                                                 NSString *screenNames = [[followersArray objectAtIndex:i]objectForKey:@"screen_name"];
                                                 //NSLog(@"%@", screenNames);
                                                 
                                                 // get images
                                                 NSString *followerImageURL = [[followersArray objectAtIndex:i] objectForKey:@"profile_image_url"];
                                                 //NSLog(@"%@", followerImageURL);
                                                 
                                                 NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:followerImageURL]];
                                                 
                                                 UIImage *followerImages = [UIImage imageWithData:data];
                                                 //NSLog(@"%@", followerImages);
                                                 
                                                 // create custom objects
                                                 FollowerData *fData = [[FollowerData alloc] initWithTitle:screenNames icon:followerImages];
                                                 
                                                 // add objects to mutable array
                                                 [followersData addObject:fData];
                                                 //NSLog(@"%@", [followersData objectAtIndex:i]);
                                             }
                                         }
                                     }
                                     else
                                     {
                                         NSLog(@"This device is not connected to the internet.");
                                     }
                                 }];
                            }
                        }
                    }
                 }
                 else
                 {
                     NSLog(@"The user did not grant access.");
                 }
             }];
        }
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma collectionView methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    myCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    if (cell != nil)
    {
        FollowerData *details = [followersData objectAtIndex:indexPath.row];
        NSString *thisLabel = details.followerNames;
        UIImage *thisImage = details.followerIcons;
        [cell resetWithLabel:thisLabel cellImage:thisImage];
//        NSLog(@"%@", thisLabel);
    }
    
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma collectionView delegate methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *viewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    if (viewController != nil)
    {
        // grab current record and put in dictionary
        currentFollower = [followersData objectAtIndex:indexPath.row];
        
        viewController.sharedDetail = currentFollower;
        
        
        
        [self presentViewController:viewController animated:YES completion:nil];
    }
}

-(void)viewDidAppear:(BOOL)animated
{

}

@end
