//
//  TwitterCellView.m
//  ProjectOne
//
//  Created by Wesley Seago on 2/5/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "TwitterCellView.h"

@implementation TwitterCellView

@synthesize tweetText;
@synthesize timeDate;
@synthesize userImage;

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
    twitterTimeDate.text = timeDate;
    twitterImage.image = userImage.image;
}

@end
