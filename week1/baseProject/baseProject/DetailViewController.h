//
//  DetailViewController.h
//  baseProject
//
//  Created by Wesley Seago on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController.h"
#import "UserDetailsViewController.h"

@interface DetailViewController : ViewController
{
    IBOutlet UILabel *tweetText;
    IBOutlet UILabel *tweetUser;
    IBOutlet UILabel *tweetDateTime;
    IBOutlet UIImageView *tweetImage;
}

-(IBAction)onBack:(id)sender;
-(IBAction)onUser:(id)sender;

@property (nonatomic, strong) NSDictionary *tweetDictionary;
@property(nonatomic, strong) NSDictionary *currentUser;
@property (nonatomic, strong) UILabel *tweetText;
@property (nonatomic, strong) UILabel *tweetUser;
@property (nonatomic, strong) UILabel *tweetDateTime;
@property (nonatomic, strong) UIImageView *tweetImage;

@end
