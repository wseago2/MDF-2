//
//  CustomTableCell.h
//  Project4
//
//  Created by Wesley Seago on 2/24/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell
{

    IBOutlet UILabel *thisTime1;
    IBOutlet UILabel *thisTime2;
    IBOutlet UILabel *thisTime3;
    IBOutlet UILabel *thisMovieTitle;
    IBOutlet UIImageView *thisImage;
}

@property (nonatomic, strong) NSString *MovieTitle;
@property (nonatomic, strong) NSString *Time1;
@property (nonatomic, strong) NSString *Time2;
@property (nonatomic, strong) NSString *Time3;
@property (nonatomic, strong) UIImage *Image;

-(void)refreshCell;

@end
