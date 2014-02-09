//
//  FollowerInfo.m
//  collectionViewTest
//
//  Created by Wesley Seago on 12/5/13.
//  Copyright (c) 2013 Wesley Seago. All rights reserved.
//

#import "FollowerInfo.h"
#import "ViewController.h"
#import "CustomCollectionCellView.h"


@implementation FollowerInfo

// synthesize variables
@synthesize theName, theImage;

// singleton method here
-(id)initWithTitle:(NSString *)users images:(UIImage *)avatarImage
{
    if (self = [super init])
    {
        theName = users;
        theImage = avatarImage;
    }
    return self;
}

@end
