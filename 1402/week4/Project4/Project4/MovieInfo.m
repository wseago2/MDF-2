//
//  MovieInfo.m
//  Project4
//
//  Created by Wesley Seago on 2/24/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "MovieInfo.h"

@implementation MovieInfo

@synthesize movieTitle;
@synthesize time1;
@synthesize time2;
@synthesize time3;
@synthesize trailerURL;
@synthesize image;

-(id)initWithTitle:(NSString *)MovieTitle showTime1:(NSString *)Time1 showTime2:(NSString *)Time2 showTime3:(NSString *)Time3 trailerUrl:(NSURL *)TrailerURL image:(NSString *)Image
{
    movieTitle = MovieTitle;
    time1 = Time1;
    time2 = Time2;
    time3 = Time3;
    trailerURL = TrailerURL;
    image = Image;
    
    return self;
}

@end
