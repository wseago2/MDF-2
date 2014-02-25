//
//  TheaterInfo.m
//  Project4
//
//  Created by Wesley Seago on 2/24/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "TheaterInfo.h"

@implementation TheaterInfo

@synthesize theaterName;
@synthesize theaterLocation;
@synthesize theaterImage;

-(id)initWithTitle:(NSString *)TheaterName location:(NSString *)TheaterLocation image:(UIImage *)TheaterImage movies:(NSArray *)TheaterMovies
{
    if ((self = [super init]))
    {
        theaterName = TheaterName;
        theaterLocation = TheaterLocation;
        theaterImage = TheaterImage;
        theaterMovies = TheaterMovies;
    }
    
    return self;
}

@end
