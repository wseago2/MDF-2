//
//  ViewController.h
//  baseProject
//
//  Created on 9/4/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *myTableView;
    
    NSArray *twitterFeed;
}

@property (nonatomic, strong) NSDictionary *currentTweet;
@property (nonatomic, strong) NSDictionary *tweetDictionary;

-(IBAction)onPost:(id)sender;

@end
