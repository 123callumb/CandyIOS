//
//  spinData.m
//  Candy
//
//  Created by Callum Beckwith on 19/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "spinData.h"

@implementation spinData
+(BOOL)isEligibleForDailySpin {
    
    if ([NSDate date] > [self getLastCurrentDate]) {
        NSLog(@"%@", [NSDate date]);
        NSLog(@"%@", [self getLastCurrentDate]);
            return true;
    }else {
            return false;
    }

}
+(void)setCurrentDate {
    NSDateComponents *day = [[NSDateComponents alloc] init];
    day.day = 1;
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *currentDate = [cal dateByAddingComponents:day toDate:[NSDate date] options:0];
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setObject:currentDate forKey:@"current_date"];
    [nd synchronize];
}
+(NSDate*)getLastCurrentDate {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSDate *date = [nd objectForKey:@"current_date"];
    return date;
}
@end
