//
//  CustomHeader.m
//  Project4
//
//  Created by Wesley Seago on 2/25/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "CustomHeader.h"

@implementation CustomHeader

@synthesize theaterName;
@synthesize theaterLocation;
@synthesize theaterImage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
