//
//  ParkingListViewController.h
//  ParkingPal
//
//  Created by Eric Robertson on 11/20/17.
//  Copyright © 2017 Eric Robertson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ParkingListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *records;
@property (weak, nonatomic) IBOutlet UITableView *tblViewRecords;
@property (nonatomic, strong) NSManagedObjectContext *managedContext;

@end
