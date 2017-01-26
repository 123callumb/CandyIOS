//
//  trendsGenerator.m
//  Candy
//
//  Created by Callum Beckwith on 24/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "trendsGenerator.h"
#import "bonusAmounts.h"

@implementation trendsGenerator
+(int)generateRandomTrend: (int)barNo {
    
    NSDate *date = [NSDate date];
    NSCalendar *ccal = [NSCalendar currentCalendar];
    NSDateComponents *dateComp = [ccal components:NSCalendarUnitHour fromDate:date];
    
    return [self hourCheck:(int)[dateComp hour] barNum:barNo];
}

+(int)hourCheck: (int)hour barNum:(int)bar {
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSString *barName = [NSString stringWithFormat:@"trend_value_bar_%d", bar];
    NSString *barTime = [NSString stringWithFormat:@"trends_time_bar_%d", bar];
    
    int storedTime = (int)[nd integerForKey:barTime];
    
    if(storedTime != hour){

        if(storedTime == 0){
            [nd setInteger:1 forKey:barTime];
        }else {
            [nd setInteger:hour forKey:barTime];
        }
        
    [nd setInteger:[bonusAmounts generateRandIntWithBounds:1 UprBound:5] forKey:barName];
        [nd synchronize];
    }
    return (int)[nd integerForKey:barName];
}

+(int)returnNumberFromArray: (NSArray*)a probabilities:(NSArray*)prob {
    if([a count] != [prob count]){
        NSLog(@"Must create the same amount of probabilities that you did numbers");
        return 1;
    }else {
        NSMutableArray *numbers = [[NSMutableArray alloc] init];
        
        for(int i = 0; i <= ([a count] - 1);i++){
            
            NSNumber *no = [a objectAtIndex:i];
            int multiplier = (int)[prob objectAtIndex:i];
            
            for(int z = 0; z <= multiplier; z++){
                [numbers addObject:no];
            }
        }
        
        int rnd = [bonusAmounts generateRandIntWithBounds:0 UprBound:(int)([numbers count]-1)];

        return (int)[numbers objectAtIndex:rnd];
    }
}
@end
