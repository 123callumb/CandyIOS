

//
//  upgrade_slotsUnlocked.m
//  Candy
//
//  Created by Killian Comerford on 07/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "upgrade_slotsUnlocked.h"
#import "sweetDrawData.h"

NSInteger moneyValues[7];

@implementation upgrade_slotsUnlocked
+(void)setTextures:(UIImageView*)box text:(UILabel*)txt id:(double)i{
    [box setImage:[UIImage imageNamed:@"slotsUnlocked"]];
    txt.text = @"Slots Unlocked";
    moneyValues[0] = 10;
    moneyValues[1] = 16;
    moneyValues[2] = 49;
    moneyValues[3] = 105;
    moneyValues[4] = 250;
    moneyValues[5] = 500;
    moneyValues[6] = 1000;
}
+(void)whenPressed:(long)upgradePro{
    if(upgradePro < 8)[sweetDrawData setDrawsUnlocked:(int)(upgradePro)];
}
+(void)fetchMoney:(long)upgradeVal text:(UILabel*)txt{
    if(upgradeVal < 7){
        long money = moneyValues[upgradeVal];
        txt.text = [NSString stringWithFormat:@"%ld",money];
    }
    else [txt setText:@"COMPLETE"];
}

@end
