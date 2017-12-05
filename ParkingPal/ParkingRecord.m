//
//  ParkingRecord.m
//  ParkingPal
//
//  Created by Eric Robertson on 11/15/17.
//  Copyright © 2017 Eric Robertson. All rights reserved.
//

#import "ParkingRecord.h"

@implementation ParkingRecord

- (ParkingRecord *)initWithParams:(double)x latitude:(double)y title:(NSString *)title{
    
    self.longitude = x;
    self.latitude = y;
    self.title = title;
    
    return self;
}

@end
