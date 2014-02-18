//
//  ViewController.h
//  ProjectTwo
//
//  Created by Wesley Seago on 2/9/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>

@interface ViewController : UIViewController < UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    NSDictionary *twitterFeed;
    NSArray *followersArray;
    NSMutableArray *followersData;
    IBOutlet UICollectionView *myCollectionView;
}

// assign accountStore to a property to keep it alive
@property (nonatomic, strong) ACAccountStore *accountStore;
@property (nonatomic, strong) NSDictionary *twitterFeed;
@property (nonatomic, strong) NSMutableArray *followersData;
@property (nonatomic, strong) NSDictionary *currentFollower;

@end
