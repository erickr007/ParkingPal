//
//  ParkingDetailsViewController.h
//  ParkingPal
//
//  Created by Eric Robertson on 11/20/17.
//  Copyright © 2017 Eric Robertson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParkingRecord.h"

@interface ParkingDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblRecord;
@property ParkingRecord *record;

- (void)loadData:(ParkingRecord *)record;

@end
