//
//  ViewController.h
//  Project4
//
//  Created by Wesley Seago on 2/24/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *myTableview;
    
    NSMutableArray *movieTheaters;
    NSMutableArray *moviesTheater1;
    NSMutableArray *moviesTheater2;
    NSMutableArray *moviesTheater3;
    
}

@end
