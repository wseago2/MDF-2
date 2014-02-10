//
//  myCollectionCell.h
//  collectionTest
//
//  Created by Wesley Seago on 2/9/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myCollectionCell : UICollectionViewCell
{
    
}

@property (nonatomic, strong) IBOutlet UILabel *textLabel;
@property (nonatomic, strong) IBOutlet UIImageView *cellImageView;

-(void)resetWithLabel:(NSString *)labelText imageName:(UIImage *)cellImage;

@end
