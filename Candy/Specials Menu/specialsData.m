//
//  specialsData.m
//  Candy
//
//  Created by Callum Beckwith on 07/03/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "specialsData.h"

@implementation specialsData

int specialActiveWithID = -1;
int specialsMultiplier = 1;
bool specialsAutoHold = false;

+(int)getSpecialActiveWithID {
    return specialActiveWithID;
}
+(int)getSpecialsMultiplier {
    return specialsMultiplier;
}
+(void)activateSpecialWithID:(int)itemNumber {
    if(itemNumber == 0){
        [self createMultipierEffectOf:5 duration:30];
    }
    if(itemNumber == 1){
        [self createMultipierEffectOf:10 duration:30];
    }
    if(itemNumber == 2){
        [self createMultipierEffectOf:15 duration:30];
    }
    if(itemNumber == 3){
        [self allowHoldDownForDuration:30];
    }
    if(itemNumber == 4){
        [self allowHoldDownForDuration:60];
    }
    if(itemNumber == 5){
        [self allowHoldDownForDuration:120];
    }
    specialActiveWithID = itemNumber;
}
+(void)createMultipierEffectOf:(int)multiplier duration:(int)time {
    specialsMultiplier = multiplier;
    [self startTimerAtValue:time];
}
+(void)allowHoldDownForDuration:(int)seconds {
    specialsAutoHold = true;
    [self startTimerAtValue:seconds];
}
+(void)startTimerAtValue:(int)seconds {
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *value = [NSDateComponents new];
    value.second = seconds;
    NSDate *min = [cal dateByAddingComponents:value toDate:date options:0];
    [[NSUserDefaults standardUserDefaults] setObject:min forKey:@"specials_timer"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(int)getSpecialsTimeLeft {
    NSDate *dateL = [[NSUserDefaults standardUserDefaults] objectForKey:@"specials_timer"];
    
    if(dateL == nil){
        return 0;
    }
    
    NSDate *current = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *thing = [cal components:NSCalendarUnitSecond fromDate:current toDate:dateL options:0];
    return (int)[thing second];
}
+(bool)getHoldDownValue {
    return specialsAutoHold;
}
+(void)checkForSpecialTimerCompletion {
    if([self getSpecialsTimeLeft] <= 0){
        specialActiveWithID = -1;
        specialsMultiplier = 1;
        specialsAutoHold = false;
    }
}
+(NSString*)determineSpecialIcon {
    if(specialActiveWithID == 0){
        return @"5xIcon";
    }
    if(specialActiveWithID == 1){
        return @"10xIcon";
    }
    if(specialActiveWithID == 2){
        return @"15xIcon";
    }
    if(specialActiveWithID == 3 || specialActiveWithID == 4 || specialActiveWithID == 5){
        return @"autoIcon";
    }
    else return nil;
}
@end
