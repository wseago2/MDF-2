//
//  TheaterInfo.h
//  Project4
//
//  Created by Wesley Seago on 2/24/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TheaterInfo : NSObject
{
    NSString *theaterName;
    NSString *theaterLocation;
    UIImage *theaterImage;
    NSArray *theaterMovies;
}

@property (nonatomic, strong) NSString *theaterName;
@property (nonatomic, strong) NSString *theaterLocation;
@property (nonatomic, strong) UIImage *theaterImage;

-(id)initWithTitle:(NSString *)TheaterName location:(NSString *)TheaterLocation image:(UIImage *)TheaterImage movies:(NSArray *)TheaterMovies;

@end
