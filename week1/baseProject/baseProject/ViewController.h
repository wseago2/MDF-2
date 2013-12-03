//
//  ViewController.h
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
{
    IBOutlet UITableView *myTableView;
    
    NSArray *twitterFeed;
    
    UIActivityIndicatorView *activityIndicator;
    
}

@property (nonatomic, strong) NSDictionary *currentTweet;
@property (nonatomic, strong) NSDictionary *tweetDictionary;

-(IBAction)onPost:(id)sender;
-(IBAction)onRefresh:(id)sender;

@end
