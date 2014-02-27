//
//  MovieViewController.h
//  Project4
//
//  Created by Wesley Seago on 2/24/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieInfo.h"
#import <MediaPlayer/MediaPlayer.h>

@interface MovieViewController : UIViewController
{
    IBOutlet UILabel *thisMovieTitle;
    IBOutlet UIView *trailerView;
    
    MPMoviePlayerController *moviePlayer;
}

-(IBAction)onBack:(id)sender;
-(IBAction)onStop:(id)sender;
-(IBAction)onPlay:(id)sender;

@property (nonatomic, strong) MovieInfo *movieDetailData;
@property (nonatomic, strong) NSString *MovieTitle;

@end
