//
//  ParkingRecord.h
//  ParkingPal
//
//  Created by Eric Robertson on 11/15/17.
//  Copyright © 2017 Eric Robertson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParkingRecord : NSObject

@property double latitude;
@property double longitude;
@property NSString *title;

- (ParkingRecord *)initWithParams:(double)x latitude:(double)y title:(NSString *)title;

@end
