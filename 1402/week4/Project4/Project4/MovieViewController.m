//
//  MovieViewController.m
//  Project4
//
//  Created by Wesley Seago on 2/24/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

@synthesize movieDetailData, MovieTitle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // set title
    MovieTitle = movieDetailData.movieTitle;
    thisMovieTitle.text = MovieTitle;
    
    // set image
    NSString *movieImage = movieDetailData.image;
    NSURL *url = [NSURL URLWithString:movieImage];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *thisMovieImage = [UIImage imageWithData:imageData];
    thisImage.Image = thisMovieImage;
    
    // set movie
    NSURL *trailerUrl = movieDetailData.trailerURL;
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:trailerUrl];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onBack:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)onStop:(id)sender
{
    [moviePlayer stop];
}

-(IBAction)onPlay:(id)sender
{
    moviePlayer.fullscreen = NO;
    moviePlayer.controlStyle = MPMovieControlStyleNone;
    moviePlayer.view.frame = CGRectMake(0.0f, 0.0f, trailerView.frame.size.width, trailerView.frame.size.height);
    [trailerView addSubview:moviePlayer.view];
    [moviePlayer play];
}

@end
