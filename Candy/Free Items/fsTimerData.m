//
//  fsTimerData.m
//  Candy
//
//  Created by Callum Beckwith on 31/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "fsTimerData.h"

@implementation fsTimerData

//Literally all these methods are the same so ill make a core method later on and clean this class up!

+(void)storeNextGemAdvert {
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *hour = [NSDateComponents new];
    hour.minute = 20;
    NSDate *min = [cal dateByAddingComponents:hour toDate:date options:0];
    [[NSUserDefaults standardUserDefaults] setObject:min forKey:@"next_gem_ad"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(int)getGemTimeLeft {
    NSDate *dateL = [[NSUserDefaults standardUserDefaults] objectForKey:@"next_gem_ad"];
    
    if(dateL == nil){
        return 0;
    }
    
    NSDate *current = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *thing = [cal components:NSCalendarUnitMinute fromDate:current toDate:dateL options:0];
    return (int)[thing minute];
}
+(void)storeNextCoinAdvert {
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *hour = [NSDateComponents new];
    hour.minute = 2;
    NSDate *min = [cal dateByAddingComponents:hour toDate:date options:0];
    [[NSUserDefaults standardUserDefaults] setObject:min forKey:@"next_coin_ad"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(int)getCoinTimeLeft {
    NSDate *dateL = [[NSUserDefaults standardUserDefaults] objectForKey:@"next_coin_ad"];
    
    if(dateL == nil){
        return 0;
    }
    
    NSDate *current = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *thing = [cal components:NSCalendarUnitSecond fromDate:current toDate:dateL options:0];
    return (int)[thing second];
}
+(void)storeNextMiniGemAdvert {
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *hour = [NSDateComponents new];
    hour.minute = 3;
    NSDate *min = [cal dateByAddingComponents:hour toDate:date options:0];
    [[NSUserDefaults standardUserDefaults] setObject:min forKey:@"next_miniGem_ad"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(int)getMiniGemTimeLeft {
    NSDate *dateL = [[NSUserDefaults standardUserDefaults] objectForKey:@"next_miniGem_ad"];
    
    if(dateL == nil){
        return 0;
    }
    
    NSDate *current = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *thing = [cal components:NSCalendarUnitSecond fromDate:current toDate:dateL options:0];
    return (int)[thing second];
}
@end
