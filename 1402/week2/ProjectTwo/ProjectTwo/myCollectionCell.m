//
//  myCollectionCell.m
//  ProjectTwo
//
//  Created by Wesley Seago on 2/10/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "myCollectionCell.h"

@implementation myCollectionCell

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

-(void)resetWithLabel:(NSString*)labelText cellImage:(UIImage*)cellImage
{
    self.textLabel.text = labelText;
    self.cellImageView.image = cellImage;
}

@end
