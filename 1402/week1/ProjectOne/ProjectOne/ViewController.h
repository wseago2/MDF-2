//
//  ViewController.h
//  ProjectOne
//
//  Created by Wesley Seago on 2/5/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *myTableView;
    
    NSArray *twitterFeed;
}

-(IBAction)onPost:(id)sender;
-(IBAction)onRefresh:(id)sender;
-(IBAction)onUser:(id)sender;

@property (nonatomic, strong) NSDictionary *tweetDictionary;
@property (nonatomic, strong) NSDictionary *currentTweet;

@end
