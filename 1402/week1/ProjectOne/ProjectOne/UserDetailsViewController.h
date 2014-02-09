//
//  UserDetailsViewController.h
//  ProjectOne
//
//  Created by Wesley Seago on 2/6/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailsViewController : UIViewController
{
    IBOutlet UILabel *detailUser;
    IBOutlet UILabel *detailDescription;
    IBOutlet UILabel *detailFollowers;
    IBOutlet UILabel *detailFriends;
}

-(IBAction)onDone:(id)sender;

@property (nonatomic, strong) NSDictionary *tweetDictionary;

@end
