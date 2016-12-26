

//
//  upgrade_slotsUnlocked.m
//  Candy
//
//  Created by Killian Comerford on 07/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "upgrade_slotsUnlocked.h"
#import "box1.h"

@implementation upgrade_slotsUnlocked



+(void)setTextures:(UIImageView*)box text:(UILabel*)txt money:(UILabel*)txtMoney id:(double)i{
    [box setImage:[UIImage imageNamed:@"slotsUnlocked"]];
    txt.text = @"Slots Unlocked";
    [self calculateMoney:i text:txtMoney];
}
+(void)whenPressed:(long)upgradePro{
    if(upgradePro < 5)[box1 setUnlockedSlots:(int)(upgradePro+1)];
}
+(void)calculateMoney:(double)i text:(UILabel*)txt{
    double money = 1000 * (exp(i));
    //NSLog(@"%f",money);
    [txt removeFromSuperview];
    txt.text = @ "OIOIOI";
    NSLog(@"%@", @"MONEY$$$");
    NSLog(@"%f", money);
    //jess was ere xoxoxoxo :* ;)
    //hi calljm i am hacking u
    
}

@end
