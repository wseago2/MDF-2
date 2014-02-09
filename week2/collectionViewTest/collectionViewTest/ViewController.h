//
//  ViewController.h
//  collectionViewTest
//
//  Created by Wesley Seago on 12/5/13.
//  Copyright (c) 2013 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    IBOutlet UICollectionView *theCollectionView;
    
    NSDictionary *tweetDictionary;
    NSArray *users;
    NSMutableArray *nameArray;
    NSString *userName;
    UIImage *userAvatar;
}

@property (nonatomic, strong) NSMutableArray *userData;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) UIImage *userAvatar;
@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) NSString *theName;

@end
