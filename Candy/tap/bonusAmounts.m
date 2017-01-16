//
//  bonusAmounts.m
//  Candy
//
//  Created by Callum Beckwith on 11/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "bonusAmounts.h"
#import "buildingType.h"
#import "gems.h"
#import "money.h"

@implementation bonusAmounts
+(int)calculateMiniGemReturn {
    int miniGems = 0;
    
    for(int i = 0; i <= ([[buildingType getBuildingTypes] count] - 1); i++){
        if([buildingType getCurrentBuildingID] == i){
            miniGems = ([self generateRandIntWithBounds:1 UprBound:2] * i);
        }
    }

    return miniGems;
}
+(int)calculateCoinReturn {
    int coins = 0;
    
    for(int i = 0; i <= ([[buildingType getBuildingTypes] count] - 1); i++){
        if([buildingType getCurrentBuildingID] == i){
            coins = ([self generateRandIntWithBounds:1 UprBound:30] * i);
        }
    }
    
    return coins;
}
+(int)generateRandIntWithBounds: (int)lwrBound UprBound:(int)uprBound {
    int lowerBound = lwrBound;
    int upperBound = uprBound;
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    return rndValue;
}
@end
