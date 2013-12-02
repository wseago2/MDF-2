//
//  CustomCell.h
//  baseProject
//
//  Created by Wesley Seago on 12/1/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    IBOutlet UILabel *twitterText;
    IBOutlet UILabel *twitterUsername;
    IBOutlet UILabel *twitterTimeDate;
    IBOutlet UIImageView *twitterImage;
}

@property (nonatomic, strong) NSString *tweetText;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *timeDate;
@property (nonatomic, strong) UIImageView *userImage;


-(void)refreshCell;

@end
