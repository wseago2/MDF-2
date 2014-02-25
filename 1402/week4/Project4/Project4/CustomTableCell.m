//
//  CustomTableCell.m
//  Project4
//
//  Created by Wesley Seago on 2/24/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "CustomTableCell.h"

@implementation CustomTableCell

@synthesize MovieTitle, Time1, Time2, Time3;

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
    thisMovieTitle.text = MovieTitle;
    thisTime1.text = Time1;
    thisTime2.text = Time2;
    thisTime3.text = Time3;
}

@end
