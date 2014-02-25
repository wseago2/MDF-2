//
//  MovieInfo.h
//  Project4
//
//  Created by Wesley Seago on 2/24/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieInfo : NSObject
{
    
}

@property (nonatomic, strong) NSString *movieTitle;
@property (nonatomic, strong) NSString *time1;
@property (nonatomic, strong) NSString *time2;
@property (nonatomic, strong) NSString *time3;
@property (nonatomic, strong) NSURL *trailerURL;
@property (nonatomic, strong) NSString *image;


-(id)initWithTitle:(NSString *)MovieTitle showTime1:(NSString *)Time1 showTime2:(NSString *)Time2 showTime3:(NSString *)Time3 trailerUrl:(NSURL *)TrailerURL image:(NSString *)Image;

@end
