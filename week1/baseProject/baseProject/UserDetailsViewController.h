//
//  UserDetailsViewController.h
//  baseProject
//
//  Created by Wesley Seago on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "ViewController.h"

@interface UserDetailsViewController : ViewController
{
    IBOutlet UILabel *userDetailsName;
    IBOutlet UILabel *userDetailsDescription;
    IBOutlet UILabel *userDetailsFollowers;
    IBOutlet UILabel *userDetailsFriends;
}

-(IBAction)onBack:(id)sender;

@property (nonatomic, strong) NSDictionary *tweetDictionary;
@property (nonatomic, strong) UILabel *userDetailsName;
@property (nonatomic, strong) UILabel *userDetailsDescription;
@property (nonatomic, strong) UILabel *userDetailsFollowers;
@property (nonatomic, strong) UILabel *userDetailsFriends;

@end
