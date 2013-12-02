//
//  CustomCell.m
//  baseProject
//
//  Created by Wesley Seago on 12/1/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize tweetText, username, timeDate, userImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)refreshCell
{
    twitterText.text = tweetText;
    twitterUsername.text = username;
    twitterTimeDate.text = timeDate;
    twitterImage.image = userImage.image;
}

@end
