//
//  MovieDetailViewController.m
//  Project4
//
//  Created by Wesley Seago on 2/24/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "MovieDetailViewController.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

@synthesize detailData, MovieTitle, Time1, Time2, Time3;

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
    //NSLog(@"%@", detailData);
    MovieTitle = detailData.movieTitle;
    Time1 = detailData.time1;
    Time2 = detailData.time2;
    Time3 = detailData.time3;

    NSString *movieImage = detailData.image;
    NSURL *url = [NSURL URLWithString:movieImage];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *thisMovieImage = [UIImage imageWithData:imageData];
    
    thisMovieTitle.text = MovieTitle;
    thisTime1.text = Time1;
    thisTime2.text = Time2;
    thisTime3.text = Time3;
    thisImage.Image = thisMovieImage;
    
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

-(IBAction)onMovie:(id)sender
{
    MovieViewController *movieViewController = [[MovieViewController alloc] initWithNibName:@"MovieViewController" bundle:nil];
    if (movieViewController != nil)
    {
        movieViewController.movieDetailData = detailData;
        
        [self presentViewController:movieViewController animated:YES completion:nil];
    }
}

@end
