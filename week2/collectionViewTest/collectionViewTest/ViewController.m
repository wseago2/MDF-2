//
//  ViewController.m
//  collectionViewTest
//
//  Created by Wesley Seago on 12/5/13.
//  Copyright (c) 2013 Wesley Seago. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionCellView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    UINib *nib = [UINib nibWithNibName:@"CustomCollectionCellView" bundle:nil];
    if (nib != nil)
    {
        [theCollectionView registerNib:nib forCellWithReuseIdentifier:@"customCell"];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionCellView *cell = [theCollectionView  dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    if (cell != nil)
    {
        [cell refreshCellData:[UIImage imageNamed:@"placeholder"] titleString: [NSString stringWithFormat:@" cell %d", indexPath.row]];
    }
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

@end
