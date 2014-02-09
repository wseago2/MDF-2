//
//  CustomCollectionCellView.h
//  collectionViewTest
//
//  Created by Wesley Seago on 12/5/13.
//  Copyright (c) 2013 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FollowerInfo.h"


@interface CustomCollectionCellView : UICollectionViewCell
{
    IBOutlet UIImageView *backgroundImageView;
    IBOutlet UILabel *title;
}

-(void)refreshCellData:(UIImage*)image titleString:(NSString*)titleString;

@property FollowerInfo *thisUser;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIImageView *backgroundImageView;

@end
