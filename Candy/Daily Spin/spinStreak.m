//
//  spinStreak.m
//  Candy
//
//  Created by Callum Beckwith on 29/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "spinStreak.h"
#import "money.h"
#import "gems.h"
#import "spinData.h"


@implementation spinStreak
+(NSString*)determineSpinStreakPrize {

    if([spinData getStreakValue] == 1){
        [money addBalance:1500];
        return @"x1500 Coins";
    }
    if([spinData getStreakValue] == 2){
        [gems addMiniGems:10];
        return @"x10 Mini Gems";
    }
    if([spinData getStreakValue] == 3){
        [gems addGems:1];
        return @"x1 Gem";
    }
    if([spinData getStreakValue] == 4){
        [money addBalance:7500];
        return @"x7500 Coins";
    }
    if([spinData getStreakValue] == 5){
        [gems addGems:2];
        return @"x2 Gems";
    }
    if([spinData getStreakValue] == 6){
        [money addBalance:10000];
        return @"x10000 Coins";
    }
    if([spinData getStreakValue] == 7){
        [gems addMiniGems:20];
        return @"x20 Mini Gems";
    }
    if([spinData getStreakValue] == 8){
        [gems addGems:2];
        return @"x2 Gem";
    }
    if([spinData getStreakValue] == 9){
        [money addBalance:20000];
        return @"x20000 Coins";
    }
    if([spinData getStreakValue] == 10){
        [gems addGems:4];
        return @"x4 Gems";
    }
    if([spinData getStreakValue] == 11){
        [money addBalance:25000];
        return @"x25000 Coins";
    }
    if([spinData getStreakValue] == 12){
        [gems addMiniGems:30];
        return @"x30 Mini Gems";
    }
    if([spinData getStreakValue] == 13){
        [gems addGems:4];
        return @"x4 Gem";
    }
    if([spinData getStreakValue] == 14){
        [money addBalance:30000];
        return @"x30000 Coins";
    }
    if([spinData getStreakValue] == 15){
        [gems addGems:5];
        return @"x5 Gems";
    }
    if([spinData getStreakValue] == 16){
        [money addBalance:35000];
        return @"x35000 Coins";
    }
    if([spinData getStreakValue] == 17){
        [gems addMiniGems:40];
        return @"x40 Mini Gems";
    }
    if([spinData getStreakValue] == 18){
        [gems addGems:6];
        return @"x6 Gem";
    }
    if([spinData getStreakValue] == 19){
        [money addBalance:40000];
        return @"x40000 Coins";
    }
    if([spinData getStreakValue] >= 20){
        [gems addMiniGems:20];
        [gems addGems:5];
        return @"x5 Gems x20 Mini Gems";
    }
    return @"No Bonus :(";
}
@end
