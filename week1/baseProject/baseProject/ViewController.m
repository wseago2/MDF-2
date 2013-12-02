//
//  ViewController.m
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "CustomCell.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize currentTweet;

- (void)viewDidLoad
{
    UINib *twitterCellNib = [UINib nibWithNibName:@"TwitterCellView" bundle:nil];
    if (twitterCellNib != nil)
    {
        [myTableView registerNib:twitterCellNib forCellReuseIdentifier:@"TwitterCell"];
    }
    
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if (accountStore != nil)
    {
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil)
        {
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error)
             {
                if (granted)
                {
                    // create an array of user accounts
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    if (twitterAccounts != nil)
                    {
//                        NSLog(@"%@", [twitterAccounts description]);
                        // set the first account in the twitterAccounts array to currentAccount
                        ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                        if (currentAccount != nil)
                        {
                            // create timeline string
                            NSString *userTimeString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
                            
                            // ceate SL request
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:userTimeString] parameters:nil];
                            if (request != nil)
                            {
                                // 1.1 api requires a user to be logged in
                                [request setAccount:currentAccount];
                                
                                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                                 {
                                     NSInteger responseCode = [urlResponse statusCode];
                                     if (responseCode == 200)
                                     {
                                         // create twitterFeed array
                                         twitterFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                         if (twitterFeed != nil)
                                         {
                                             [myTableView reloadData];
//                                             NSLog(@"%@", [twitterFeed description]);
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

#pragma tableView method

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
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TwitterCell"];
    if (cell != nil)
    {
        NSDictionary *tweetDictionary = [twitterFeed objectAtIndex:indexPath.row];
        
        NSLog(@"Here is the tweetDictionary");
        NSLog(@"%@", tweetDictionary);
        
        NSString *tweetImage = [[tweetDictionary objectForKey:@"user"] objectForKey:@"profile_image_url"];
        
        NSURL *url = [NSURL URLWithString:tweetImage];
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        cell.tweetText = [tweetDictionary valueForKey:@"text"];
        cell.timeDate = [tweetDictionary valueForKey:@"created_at"];
        cell.username = [[tweetDictionary valueForKey:@"user"] objectForKey:@"name"];
        cell.imageView.image = [UIImage imageWithData:data];

        [cell refreshCell];
        
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *viewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
    currentTweet = [twitterFeed objectAtIndex:indexPath.row];
    
    viewController.tweetDictionary = currentTweet;
    
    [self presentViewController:viewController animated:YES completion:nil];
    
//    NSDictionary *tweetDictionary = [twitterFeed objectAtIndex:indexPath.row];
    
//    NSLog(@"%@", [tweetDictionary description]);
}

-(IBAction)onPost:(id)sender
{
    SLComposeViewController *slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    if (slComposeViewController != nil)
    {
        [slComposeViewController setInitialText:@"this is my text"];
        
        [self presentViewController:slComposeViewController animated:YES completion:nil];
    }
}

@end
