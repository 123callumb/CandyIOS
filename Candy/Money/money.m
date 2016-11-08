//
//  money.m
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

// We will use ns user defaults in the future when we want the game to remmebr the integer value!

#import "money.h"
int moneyBalance = 0;

@implementation money

+(void)addBalance: (int)x{
    moneyBalance = moneyBalance + x;
}

+(int)getBalance {
    return moneyBalance;
}
+(NSString*)getBalanceAsString {
    NSString *bal = [NSString stringWithFormat:@"%d", moneyBalance];
    return bal;
}

@end
