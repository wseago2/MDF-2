//
//  FollowerData.m
//  ProjectTwo
//
//  Created by Wesley Seago on 2/10/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "FollowerData.h"
#import "ViewController.h"

@implementation FollowerData

@synthesize followerNames;
@synthesize followerIcons;

-(id)initWithTitle:(NSString *)follower icon:(UIImage *)followerIcon
{
    if ((self = [super init]))
    {
        followerNames = follower;
        followerIcons = followerIcon;
    }
    return self;
}

@end
