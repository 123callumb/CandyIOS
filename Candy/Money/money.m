//
//  money.m
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

// We will use ns user defaults in the future when we want the game to remmebr the integer value!

#import "money.h"

@implementation money

+(void)addBalance: (int)x{
    [[NSUserDefaults standardUserDefaults] setInteger:([self getBalance]+x) forKey:[NSString stringWithFormat:@"moneyValue"]];
}

+(int)getBalance {
    int moneyBalance = (int)[[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"moneyValue"]];
    return moneyBalance;
}
+(NSString*)getBalanceAsString {
    NSString *bal = [NSString stringWithFormat:@"%d", [self getBalance]];
    return bal;
}

@end
