//
//  FollowerData.h
//  ProjectTwo
//
//  Created by Wesley Seago on 2/10/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FollowerData : NSObject
{
    NSString *followerNames;
    UIImage *followerIcons;
}

-(id)initWithTitle:(NSString *)follower icon:(UIImage *)followerIcon;

@property (nonatomic, strong) NSString *followerNames;
@property (nonatomic, strong) UIImage *followerIcons;

@end
