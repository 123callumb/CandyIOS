

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

+(void)setTextures:(UIImageView*)box text:(UILabel*)txt{
    [box setImage:[UIImage imageNamed:@"slotsUnlocked"]];
    txt.text = @"Slots Unlocked";
}
+(void)whenPressed:(long)upgradePro{
    if(upgradePro < 5)[box1 setUnlockedSlots:(int)(upgradePro+1)];
}

@end
