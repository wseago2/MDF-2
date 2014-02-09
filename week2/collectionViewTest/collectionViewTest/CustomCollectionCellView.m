//
//  CustomCollectionCellView.m
//  collectionViewTest
//
//  Created by Wesley Seago on 12/5/13.
//  Copyright (c) 2013 Wesley Seago. All rights reserved.
//

#import "CustomCollectionCellView.h"

@implementation CustomCollectionCellView

@synthesize title;
@synthesize backgroundImageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)refreshCellData:(UIImage *)image titleString:(NSString *)userNames
{
    backgroundImageView.image = image;
    title.text = userNames;
}

@end
