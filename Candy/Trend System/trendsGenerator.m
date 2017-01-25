//
//  trendsGenerator.m
//  Candy
//
//  Created by Callum Beckwith on 24/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "trendsGenerator.h"

@implementation trendsGenerator
+(int)generateRandomTrend {
    
    NSDate *date = [NSDate date];
    NSCalendar *ccal = [NSCalendar currentCalendar];
    NSDateComponents *dateComp = [ccal components:NSCalendarUnitHour fromDate:date];
    [self generateRandomNumberBasedOnHour:(int)[dateComp hour]];
    return 1;
}

+(void)generateRandomNumberBasedOnHour: (int)hour {

}
@end
