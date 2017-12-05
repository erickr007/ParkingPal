//
//  ParkingDetailsViewController.m
//  ParkingPal
//
//  Created by Eric Robertson on 11/20/17.
//  Copyright © 2017 Eric Robertson. All rights reserved.
//

#import "ParkingDetailsViewController.h"

@interface ParkingDetailsViewController ()

@end

@implementation ParkingDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.lblRecord.text = self.record.title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData:(ParkingRecord *)record{
    self.record = record;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
