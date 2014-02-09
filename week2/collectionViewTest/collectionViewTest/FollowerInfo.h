//
//  FollowerInfo.h
//  collectionViewTest
//
//  Created by Wesley Seago on 12/5/13.
//  Copyright (c) 2013 Wesley Seago. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FollowerInfo : NSObject
{
    // data here
    NSString *theName;
    UIImage *theImage;
}

// properties here
@property (nonatomic, strong) NSString *theName;
@property (nonatomic, strong) UIImage *theImage;

// method here
-(id)initWithTitle:(NSString *)users images:(UIImage *)avatarImage;

@end
