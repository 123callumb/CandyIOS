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
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    NSDate *date = [NSDate date];
    NSCalendar *ccal = [NSCalendar currentCalendar];
    
    if([nd objectForKey:@"next_spin_date"] == nil){
        
        return true;
        
    }else{
    
        NSDateComponents *dateGap = [ccal components:NSCalendarUnitDay fromDate:date toDate:[nd objectForKey:@"next_spin_date"] options:0];
    
        if ([dateGap day] >= 1) {
            return true;
        }else {
            return false;
        }
    }
}
+(void)setCurrentDate {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    NSDate *date = [NSDate date];
    NSCalendar *ccal = [NSCalendar currentCalendar];
    NSDateComponents *day = [NSDateComponents new];
    day.day = 1;
    NSDate *dateComp = [ccal dateByAddingComponents:day toDate:date options:0];
    
    [nd setObject:dateComp forKey:@"next_spin_date"];
    [nd synchronize];
}
@end
