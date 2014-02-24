//
//  ViewController.m
//  Project4
//
//  Created by Wesley Seago on 2/24/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    //MovieInfo custom objects
    
    //TheaterInfo custom objects
    
    //TheaterInfoObjects array
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma tableView methods
-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableCell"];
    if (cell != nil)
    {
    return cell;
    }
    
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake (0.0f, 0.0f, myTableview.frame.size.width, 30.0f)];
    if (headerLabel != nil)
    {
        headerLabel.backgroundColor = [UIColor redColor];
        headerLabel.text = @"This Theater";
    }
    return headerLabel;
}

@end
