//
//  ParkingListViewController.m
//  ParkingPal
//
//  Created by Eric Robertson on 11/20/17.
//  Copyright © 2017 Eric Robertson. All rights reserved.
//

#import "ParkingListViewController.h"
#import "ParkingDetailsViewController.h"
#import "ParkingRecord.h"
#import "AppDelegate.h"

@interface ParkingListViewController ()

@end

@implementation ParkingListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated{
    
    //- setup fetch request
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedContext = appDelegate.persistentContainer.viewContext;
    
    NSFetchRequest *fetchRequest = [NSFetchRequest<NSManagedObject *>  fetchRequestWithEntityName:@"ParkingRecord"];
    NSError *error = nil;
    
    self.records = [self.managedContext executeFetchRequest:fetchRequest error:&error];
    
    if(!self.records){
        NSLog(@"Error occurred fetching parking records: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString *myid = @"MyReusableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myid];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myid];
    }
    
    ParkingRecord *record = [self.records objectAtIndex:indexPath.row];
    cell.textLabel.text = record.title;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.records.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ParkingRecord *record = self.records[indexPath.row];
    ParkingDetailsViewController *details = [[ParkingDetailsViewController alloc] init];
    
    [details loadData:record];
    
    //[self.navigationController pushViewController:details animated:YES];
    [self performSegueWithIdentifier:@"segueParkingDetails" sender:record];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueParkingDetails"]){
        ParkingDetailsViewController *details = (ParkingDetailsViewController *)segue.destinationViewController;
        details.record = (ParkingRecord *)sender;
    }
}

- (void)loadData{
    self.tblViewRecords.delegate = self;
    self.tblViewRecords.dataSource = self;
    
    //- load mock records
    ParkingRecord *r1 = [[ParkingRecord alloc] initWithParams:117.89 latitude:-32.741 title:@"Lot 38"];
    ParkingRecord *r2 = [[ParkingRecord alloc] initWithParams:118.89 latitude:-32.941 title:@"Westfield"];
    
    self.records = @[r1, r2];
    
    [self.tblViewRecords reloadData];
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
