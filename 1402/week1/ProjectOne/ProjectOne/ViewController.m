//
//  ViewController.m
//  ProjectOne
//
//  Created by Wesley Seago on 2/5/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "TwitterCellView.h"
#import "DetailViewController.h"
#import "UserDetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tweetDictionary;
@synthesize currentTweet;

- (void)viewDidLoad
{
    // register custom cell
    UINib *twitterCellNib = [UINib nibWithNibName:@"TwitterCellView" bundle:nil];
    if (twitterCellNib != nil)
    {
        [myTableView registerNib:twitterCellNib forCellReuseIdentifier:@"TwitterCell"];
    }
    
    // create accountStore
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil)
    {
        // create accountType assign twitter
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
                         // NSLog(@"%@", [twitterAccounts description]);
                         
                         // select first account and assign to currentAccount
                         ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                         if (currentAccount != nil)
                         {
                            // NSLog(@"%@", [currentAccount description]);
                             
                             // create request string
                             NSString *userTimeString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
                             
                             // create SL request
                             SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:userTimeString] parameters:nil];
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
                                              [myTableView reloadData];
                                              NSLog(@"%@", [[twitterFeed objectAtIndex:0] description]);
                                          }
                                      }
                                  }];
                             }
                         }
                     }
                 }
                 else
                 {
                     NSLog(@"User did not grant access");
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

#pragma tableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (twitterFeed != nil)
    {
        return [twitterFeed count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // store cell view in cell variable and set reuse to custom cell
    TwitterCellView *cell = [tableView dequeueReusableCellWithIdentifier:@"TwitterCell"];
    if (cell != nil)
    {
        // create dictionary for each tweet
        tweetDictionary = [twitterFeed objectAtIndex:indexPath.row];
        
        // get image
        
        // create string for url
        NSString *tweetImage = [[tweetDictionary objectForKey:@"user"] objectForKey:@"profile_image_url"];
        
        // create NSURL from string
        NSURL *url = [NSURL URLWithString:tweetImage];
        
        // convert image from url to data
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        cell.tweetText = [tweetDictionary valueForKey:@"text"];
        cell.timeDate = [tweetDictionary valueForKey:@"created_at"];
        cell.imageView.image = [UIImage imageWithData:data];
        
//        // get user data
//        NSDictionary *userDictionary = [tweetDictionary objectForKey:@"user"];
//        if (userDictionary != nil)
//        {
//            cell.username = [userDictionary valueForKey:@"name"];
//        }
        
        [cell refreshCell];
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // create the viewcontroller
    DetailViewController *viewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
    // grab the current tweet
    currentTweet = [twitterFeed objectAtIndex:indexPath.row];
    
    // send currentTweet
    viewController.tweetDictionary = currentTweet;
    
    // present the cell view
    [self presentViewController:viewController animated:YES completion:nil];
}

#pragma post method

-(IBAction)onPost:(id)sender
{
    SLComposeViewController *slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    if (slComposeViewController != nil)
    {
        [slComposeViewController setInitialText:@"Posted From"];
        
        [self presentViewController:slComposeViewController animated:YES completion:nil];
    }
}

#pragma refresh method

-(IBAction)onRefresh:(id)sender
{
    [self alert];
    [myTableView reloadData];
}

#pragma alert method

-(void)alert
{
    UIAlertView *alert;
    alert = [[UIAlertView alloc] initWithTitle:@"Gathering Tweets..." message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
    [alert dismissWithClickedButtonIndex:0 animated:YES];
}

#pragma onUser method

-(IBAction)onUser:(id)sender
{
    UserDetailsViewController *viewController = [[UserDetailsViewController alloc] initWithNibName:@"UserDetailsViewController" bundle:nil];
    if (viewController != nil)
    {
        viewController.tweetDictionary = tweetDictionary;
        
        [self presentViewController:viewController animated:YES completion:nil];
    }
}

@end
