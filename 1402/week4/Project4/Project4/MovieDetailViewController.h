//
//  MovieDetailViewController.h
//  Project4
//
//  Created by Wesley Seago on 2/24/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieInfo.h"
#import "MovieViewController.h"

@interface MovieDetailViewController : UIViewController
{
    IBOutlet UILabel *thisMovieTitle;
    IBOutlet UILabel *thisTime1;
    IBOutlet UILabel *thisTime2;
    IBOutlet UILabel *thisTime3;
    IBOutlet UIImageView *thisImage;
    
}

-(IBAction)onBack:(id)sender;
-(IBAction)onMovie:(id)sender;

@property (nonatomic, strong) MovieInfo *detailData;
@property (nonatomic, strong) NSString *MovieTitle;
@property (nonatomic, strong) NSString *Time1;
@property (nonatomic, strong) NSString *Time2;
@property (nonatomic, strong) NSString *Time3;
@property (nonatomic, strong) UIImage *Image;

@end
