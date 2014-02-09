//
//  ViewController.m
//  collectionViewTest
//
//  Created by Wesley Seago on 12/5/13.
//  Copyright (c) 2013 Wesley Seago. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionCellView.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "FollowerInfo.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize userName;
@synthesize userAvatar;
@synthesize nameArray;
@synthesize imageArray;
@synthesize theName;

- (void)viewDidLoad
{
    nameArray = [[NSMutableArray alloc] init];
    
    // setup the nib
    UINib *nib = [UINib nibWithNibName:@"CustomCollectionCellView" bundle:nil];
    if (nib != nil)
    {
        [theCollectionView registerNib:nib forCellWithReuseIdentifier:@"customCell"];
    }
    
//    NSMutableArray *userData = [[NSMutableArray alloc] init];
    
    // create arrays
//    NSMutableArray *nameArray = [[NSMutableArray alloc] init];
//    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    
    // create accountStore
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil)
    {
        // create accountType
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil)
        {
            // request access
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted,NSError *error)
             {
                 if (granted)
                 {
                     // create array of accounts on device
                     NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                     if (twitterAccounts != nil)
                     {
                         // set first account in accounts array to current account
                         ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                         if (currentAccount != nil)
                         {
                             // use provided string
                             NSString *friendListString = @"https://api.twitter.com/1.1/friends/list.json?cursor=-1&skip_status=true&include_user_entities=false";
                             
                             // create SLRequest
                             SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:friendListString] parameters:nil];
                             if (request != nil)
                             {
                                 // 1.1 api requires a user to be logged in
                                 [request setAccount:currentAccount];
                                 
                                 // perform request
                                 [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                                  {
                                      // check to see if request was successful
                                      NSInteger responseCode = [urlResponse statusCode];
                                      if (responseCode == 200)
                                      {
                                          // NSLog(@"%@", responseData);
                                          
                                          // array for serialized JSON
                                          tweetDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                          if (tweetDictionary != nil)
                                          {
//                                              NSLog(@"%@", tweetDictionary);
                                              [theCollectionView reloadData];
                                              
                                              // grab the users data from the JSON
                                              users = [tweetDictionary objectForKey:@"users"];
//                                              NSLog(@"%@", users);
                                
                                              // loop through users array and get names and images
                                              for (int i=0; i<[users count]; i++)
                                              {
                                                  // get each userName
                                                  userName = [[users objectAtIndex:i] objectForKey:@"name"];
 //                                                 NSLog(@"%@", userName);
                                                  
                                                  [nameArray addObject:userName];
                                                  
                                                  // get each image URL
                                                  NSString *userImage = [[users objectAtIndex:i] objectForKey:@"profile_image_url"];
//                                                  NSLog(@"%@", userImage);
                                                  
                                                  // convert image URL to data
                                                  NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:userImage]];
                                                  
                                                  // convert image data to UIImage
                                                  userAvatar = [UIImage imageWithData:imageData];
                                                  
 //                                                 [nameArray insertObject:userName atIndex:i];
                                                  [imageArray insertObject:userAvatar atIndex:i];
                                                  theName = userName;
 //                                                 NSLog(@"%@", [nameArray objectAtIndex:i]);
                                                  
                                                  
                                              }
                                          }
                                      }
                                  }];
                             }
                         }
                     }
                 }
                 else
                 {
                     NSLog(@"The User did not grant access");
                     // create alert for access denied
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

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionCellView *cell = [theCollectionView  dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    if (cell != nil)
    {
//        [cell refreshCellData:[UIImage imageNamed:@"placeholder"] titleString:[nameArray objectAtIndex:indexPath.row]];
        
        [cell refreshCellData:[UIImage imageNamed:@"placeholder"] titleString:theName];

    }
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

@end
