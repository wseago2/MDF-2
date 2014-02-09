//
//  DetailViewController.h
//  ProjectOne
//
//  Created by Wesley Seago on 2/6/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel *tweetText;
    IBOutlet UILabel *tweetDateTime;
    IBOutlet UILabel *tweetUser;
}

-(IBAction)onDone:(id)sender;

@property (nonatomic, strong) NSDictionary *tweetDictionary;

@end
