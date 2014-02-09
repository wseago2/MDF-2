//
//  TwitterCellView.h
//  ProjectOne
//
//  Created by Wesley Seago on 2/5/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwitterCellView : UITableViewCell
{
    IBOutlet UILabel *twitterText;
    IBOutlet UILabel *twitterTimeDate;
    IBOutlet UIImageView *twitterImage;
}

@property (nonatomic, strong) NSString *tweetText;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *timeDate;
@property (nonatomic, strong) UIImageView *userImage;

-(void)refreshCell;

@end
