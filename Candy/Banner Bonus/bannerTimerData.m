//
//  bannerTimerData.m
//  Candy
//
//  Created by Callum Beckwith on 02/03/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "bannerTimerData.h"

@implementation bannerTimerData
+(void)storeBonusOpenedLast {
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *hour = [NSDateComponents new];
    hour.minute = 2;
    NSDate *min = [cal dateByAddingComponents:hour toDate:date options:0];
    [[NSUserDefaults standardUserDefaults] setObject:min forKey:@"bonus_ad"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(int)getBonusOpenedLeft {
    NSDate *dateL = [[NSUserDefaults standardUserDefaults] objectForKey:@"bonus_ad"];
    
    if(dateL == nil){
        return 0;
    }
    
    NSDate *current = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *thing = [cal components:NSCalendarUnitSecond fromDate:current toDate:dateL options:0];
    return (int)[thing second];
}
@end
