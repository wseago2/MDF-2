//
//  ViewController.m
//  twitterTest
//
//  Created by Wesley Seago on 2/4/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "TwitterCellView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    UINib *twitterCellNib = [UINib nibWithNibName:@"TwitterCellView" bundle:nil];
    if (twitterfeed != nil)
    {
        [myTableView registerNib:twitterCellNib forCellReuseIdentifier:@"TwitterCell"];
    }
    
    // create account store
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
                     NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                     if (twitterAccounts != nil)
                     {
                         NSLog(@"%@", [twitterAccounts description]);
                         
                         ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                         if (currentAccount != nil)
                         {
                             NSLog(@"%@", [currentAccount username]);
                             NSLog(@"%@", [currentAccount accountDescription]);
                             
//                             NSString *userTimeString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";

//                             NSString *userTimeString = @"https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=fullsail";
                             
                             NSString *userTimeString = [NSString stringWithFormat:@"%@?%@&%@",@"https://api.twitter.com/1.1/statuses/user_timeline.json", @"screen_name=fullsail", @"count=3"];
                             
                             SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:userTimeString] parameters:nil];
                             if (request != nil)
                             {
                                 [request setAccount:currentAccount];
                                 
                                 [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                                  {
                                      NSInteger responseCode = [urlResponse statusCode];
                                      if (responseCode == 200)
                                      {
                                          twitterfeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                          if (twitterfeed != nil)
                                          {
                                              [myTableView reloadData];
                                              NSLog(@"%@", [twitterfeed description]);
//                                              NSLog(@"%@", [[twitterfeed objectAtIndex:0] description]);
                                          }
                                      }
                                  }];
                             }
                             
                         }
                     }
                 } else
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

#pragma tableview method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (twitterfeed != nil)
    {
        return [twitterfeed count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


@end
