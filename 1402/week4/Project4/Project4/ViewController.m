//
//  ViewController.m
//  Project4
//
//  Created by Wesley Seago on 2/24/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "ViewController.h"
#import "TheaterInfo.h"
#import "MovieInfo.h"
#import "CustomTableCell.h"
#import "MovieDetailViewController.h"
#import "CustomHeader.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize myTableView;

- (void)viewDidLoad
{
    // array of theaters to hold final objects
    movieTheaters = [[NSMutableArray alloc] init];
    
    // arrays of movies for each theater
    moviesTheater1 = [[NSMutableArray alloc] init];
    moviesTheater2 = [[NSMutableArray alloc] init];
    moviesTheater3 = [[NSMutableArray alloc] init];
    
    //MovieInfo custom objects with images and trailers from iTunes
    MovieInfo *movie1 = [[MovieInfo alloc] initWithTitle:@"3 Days to Kill" showTime1:@"1:20PM" showTime2:@"4:10PM" showTime3:@"7:00PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/independent/3daystokill/3daystokill-tlr1_480p.mov"] image:@"http://trailers.apple.com/trailers/independent/3daystokill/images/thumbnail_16702.jpg"];
    
    MovieInfo *movie2 = [[MovieInfo alloc] initWithTitle:@"In Secret" showTime1:@"1:15PM" showTime2:@"4:05PM" showTime3:@"6:50PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/independent/insecret/insecret-tlr1_480p.mov"] image:@"http://trailers.apple.com/trailers/independent/insecret/images/thumbnail_16282.jpg"];
    
    MovieInfo *movie3 = [[MovieInfo alloc] initWithTitle:@"Pompeii" showTime1:@"11:00AM" showTime2:@"1:45PM" showTime3:@"7:15PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/sony_pictures/pompeii/pompeii-tlr1_480p.mov"] image:@"http://trailers.apple.com/trailers/sony_pictures/pompeii/images/thumbnail_16566.jpg"];
    
    MovieInfo *movie4 = [[MovieInfo alloc] initWithTitle:@"Endless Love" showTime1:@"10:55AM" showTime2:@"1:35PM" showTime3:@"4:20PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/universal/endlesslove/endlesslove-tlr1_480p.mov"] image:@"http://trailers.apple.com/trailers/universal/endlesslove/images/thumbnail_15041.jpg"];
    
    MovieInfo *movie5 = [[MovieInfo alloc] initWithTitle:@"RoboCop" showTime1:@"12:15PM" showTime2:@"3:10PM" showTime3:@"4:25PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/sony_pictures/robocop/robocop-armedforbattle_480p.mov"]image:@"http://trailers.apple.com/trailers/sony_pictures/robocop/images/thumbnail_14026.jpg"];
    
    MovieInfo *movie6 = [[MovieInfo alloc] initWithTitle:@"Gulliver's Travels" showTime1:@"12:30PM" showTime2:@"2:55PM" showTime3:@"5:25PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/fox/gulliverstravels/gulliverstravels-tlr1b_480p.mov"] image:@"http://trailers.apple.com/trailers/fox/gulliverstravels/images/thumbnail_4919.jpg"];
    
    MovieInfo *movie7 = [[MovieInfo alloc] initWithTitle:@"About Last Night" showTime1:@"12:40PM" showTime2:@"3:05PM" showTime3:@"5:30PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/sony_pictures/aboutlastnight/aboutlastnight-tlr2_480p.mov"] image:@"http://trailers.apple.com/trailers/sony_pictures/aboutlastnight/images/thumbnail_17303.jpg"];
    
    MovieInfo *movie8 = [[MovieInfo alloc] initWithTitle:@"The Monuments Men" showTime1:@"12:30PM" showTime2:@"1:45PM" showTime3:@"5:00PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/sony_pictures/monumentsmen/themonumentsmen-unlikelyheroes_480p.mov"] image:@"http://trailers.apple.com/trailers/sony_pictures/themonumentsmen/images/thumbnail_17087.jpg"];
    
    MovieInfo *movie9 = [[MovieInfo alloc] initWithTitle:@"Winter in Wartime" showTime1:@"12:45PM" showTime2:@"3:45PM" showTime3:@"6:45PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/sony/winterinwartime/winterinwartime-tlr1_480p.mov"] image:@"http://trailers.apple.com/trailers/sony/winterinwartime/images/thumbnail_5079.jpg"];
    
    MovieInfo *movie10 = [[MovieInfo alloc] initWithTitle:@"Ride Along" showTime1:@"2:30PM" showTime2:@"4:45PM" showTime3:@"7:35PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/universal/ridealong/ridealong-tsr_480p.mov"] image:@"http://trailers.apple.com/trailers/universal/ridealong/images/thumbnail_12562.jpg"];
    
    MovieInfo *movie11 = [[MovieInfo alloc] initWithTitle:@"Frozen" showTime1:@"1:30PM" showTime2:@"5:20PM" showTime3:@"7:35PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/disney/frozen/frozen-tlr1_480p.mov"] image:@"http://trailers.apple.com/trailers/disney/frozen/images/thumbnail_14641.jpg"];
    
    MovieInfo *movie12 = [[MovieInfo alloc] initWithTitle:@"Lone Survivor" showTime1:@"12:50PM" showTime2:@"3:40PM" showTime3:@"6:45PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/universal/lonesurvivor/lonesurvivor-tlr_480p.mov"] image:@"http://trailers.apple.com/trailers/universal/lonesurvivor/images/thumbnail_13301.jpg"];
    
    MovieInfo *movie13 = [[MovieInfo alloc] initWithTitle:@"The Awkward Moment" showTime1:@"1:45PM" showTime2:@"5:40PM" showTime3:@"9:45PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/independent/thatawkwardmoment/thatakwardmoment-tlr1_480p.mov"] image:@"http://trailers.apple.com/trailers/focus_features/thatawkwardmoment/images/thumbnail_15021.jpg"];
    
    MovieInfo *movie14 = [[MovieInfo alloc] initWithTitle:@"The Nut Job" showTime1:@"1:35PM" showTime2:@"4:20PM" showTime3:@"6:25PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/independent/thenutjob/thenutjob-tlr1_480p.mov"] image:@"http://trailers.apple.com/trailers/independent/thenutjob/images/thumbnail_16545.jpg"];
    
    MovieInfo *movie15 = [[MovieInfo alloc] initWithTitle:@"Least Among Saints" showTime1:@"2:35PM" showTime2:@"4:50PM" showTime3:@"8:25PM" trailerUrl:[NSURL URLWithString:@"http://movietrailers.apple.com/movies/independent/leastamongsaints/leastamongsaints-tlr1_480p.mov"] image:@"http://trailers.apple.com/trailers/independent/leastamongsaints/images/thumbnail_7129.jpg"];
    
    // put custom movie objects into arrays
    // first theater array
    [moviesTheater1 addObject:movie1];
    [moviesTheater1 addObject:movie2];
    [moviesTheater1 addObject:movie3];
    [moviesTheater1 addObject:movie4];
    [moviesTheater1 addObject:movie5];
    
    // second theater array
    [moviesTheater2 addObject:movie6];
    [moviesTheater2 addObject:movie7];
    [moviesTheater2 addObject:movie8];
    [moviesTheater2 addObject:movie9];
    [moviesTheater2 addObject:movie10];
    
    // third theater array
    [moviesTheater3 addObject:movie11];
    [moviesTheater3 addObject:movie12];
    [moviesTheater3 addObject:movie13];
    [moviesTheater3 addObject:movie14];
    [moviesTheater3 addObject:movie15];
    
    // create custom theater objects with movies array
    TheaterInfo *movieTheater1 = [[TheaterInfo alloc] initWithTitle:@"AMC Altamonte Mall" location:@"Altamonte Springs, FL" image:[UIImage imageNamed:@"amcAltamonte.jpg"] movies:moviesTheater1];
    
    TheaterInfo *movieTheater2 = [[TheaterInfo alloc] initWithTitle:@"Regal Winter Park" location:@"Winter Park, FL" image:[UIImage imageNamed:@"regalWinterParkVillage.jpg"] movies:moviesTheater2];
    
    TheaterInfo *movieTheater3 = [[TheaterInfo alloc] initWithTitle:@"Premiere Cinema 16" location:@"Orlando, FL" image:[UIImage imageNamed:@"premierColonialTownCenter.jpg"] movies:moviesTheater3];
    
    
    // put custom theater objects in movieTheaters array
    [movieTheaters addObject:movieTheater1];
    [movieTheaters addObject:movieTheater2];
    [movieTheaters addObject:movieTheater3];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma tableView methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // register nib
        UINib *customTableCell = [UINib nibWithNibName:@"CustomTableViewCell" bundle:nil];
        if (customTableCell != nil)
        {
            [myTableview registerNib:customTableCell forCellReuseIdentifier:@"tableCell"];
        }
    
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    if (cell != nil)
    {
        
        if ([indexPath section] == 0)
        {
            MovieInfo *data = [moviesTheater1 objectAtIndex:indexPath.row];
            NSString *title = data.movieTitle;
            NSString *firstTime = data.time1;
            NSString *secondTime = data.time2;
            NSString *thirdTime = data.time3;
            
            NSString *movieImage = data.image;
            NSURL *url = [NSURL URLWithString:movieImage];
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            UIImage *thisMovieImage = [UIImage imageWithData:imageData];
            
            cell.MovieTitle = title;
            cell.Time1 = firstTime;
            cell.Time2 = secondTime;
            cell.Time3 = thirdTime;
            cell.imageView.Image = thisMovieImage;
            
        }
        else if ([indexPath section] == 1)
        {
            MovieInfo *data = [moviesTheater2 objectAtIndex:indexPath.row];
            NSString *title = data.movieTitle;
            NSString *firstTime = data.time1;
            NSString *secondTime = data.time2;
            NSString *thirdTime = data.time3;
            
            NSString *movieImage = data.image;
            NSURL *url = [NSURL URLWithString:movieImage];
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            UIImage *thisMovieImage = [UIImage imageWithData:imageData];
            
            cell.MovieTitle = title;
            cell.Time1 = firstTime;
            cell.Time2 = secondTime;
            cell.Time3 = thirdTime;
            cell.imageView.Image = thisMovieImage;
            
        }
        else if ([indexPath section] == 2)
        {
            MovieInfo *data = [moviesTheater3 objectAtIndex:indexPath.row];
            NSString *title = data.movieTitle;
            NSString *firstTime = data.time1;
            NSString *secondTime = data.time2;
            NSString *thirdTime = data.time3;
            
            NSString *movieImage = data.image;
            NSURL *url = [NSURL URLWithString:movieImage];
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            UIImage *thisMovieImage = [UIImage imageWithData:imageData];
            
            cell.MovieTitle = title;
            cell.Time1 = firstTime;
            cell.Time2 = secondTime;
            cell.Time3 = thirdTime;
            cell.imageView.Image = thisMovieImage;
        
        }
        
        [cell refreshCell];
        
        return cell;
    }
//    [myTableview reloadData];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieDetailViewController *movieDetailViewController = [[MovieDetailViewController alloc] initWithNibName:@"MovieDetailViewController" bundle:nil];
    if (movieDetailViewController != nil)
    {
    
        if ([indexPath section] == 0)
        {
            MovieInfo *DetailData = [moviesTheater1 objectAtIndex:indexPath.row];
            movieDetailViewController.detailData = DetailData;
            //NSLog(@"The indexPath section was 0");
            
        }
        else if ([indexPath section] == 1)
        {
            MovieInfo *DetailData = [moviesTheater2 objectAtIndex:indexPath.row];
            movieDetailViewController.detailData = DetailData;
            //NSLog(@"The indexPath section was 1");
            
        }
        else if ([indexPath section] == 2)
        {
            MovieInfo *DetailData = [moviesTheater3 objectAtIndex:indexPath.row];
            movieDetailViewController.detailData = DetailData;
            //NSLog(@"The indexPath section was 2");
            
        }
        
    [self presentViewController:movieDetailViewController animated:YES completion:nil];
    }
}

// stackoverflow.com/questions/12556750/using-a-xib-file-for-custom-tableview-section-header

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // create an array for the headers
    NSArray *customHeaders = [[NSBundle mainBundle]loadNibNamed:@"CustomHeader" owner:self options:nil];
    
    // create CustomHeader view
    CustomHeader *view = (CustomHeader *) [customHeaders objectAtIndex:0];
    
    // get the section index for the theater objects
    TheaterInfo *theaterHeader = [movieTheaters objectAtIndex:section];
    
    // create variables for the labels and image
    NSString *headerName = theaterHeader.theaterName;
    NSString *headerLocation = theaterHeader.theaterLocation;
    UIImage *headerImage = theaterHeader.theaterImage;
    
    // add the labels and images
    view.theaterName.text = headerName;
    view.theaterLocation.text = headerLocation;
    view.theaterImage.image = headerImage;
    
    // return the view
    return view;
}

@end
