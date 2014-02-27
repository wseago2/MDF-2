//
//  CustomHeader.h
//  Project4
//
//  Created by Wesley Seago on 2/25/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomHeader : UITableViewHeaderFooterView
{
    IBOutlet UILabel *theaterName;
    IBOutlet UILabel *theaterLocation;
    IBOutlet UIImageView *theaterImage;
}

@property (nonatomic, strong) UILabel *theaterName;
@property (nonatomic, strong) UILabel *theaterLocation;
@property (nonatomic, strong) UIImageView *theaterImage;

@end
