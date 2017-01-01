//
//  gemPotData.m
//  Candy
//
//  Created by Callum Beckwith on 01/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "gemPotData.h"
#import "gemInteractionUI.h"
#import "gems.h"

@implementation gemPotData
//Mini Gems in the pot

+(int)getGems {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    int value = (int)[nd integerForKey:@"gemPotValue"];
    
    if(!value || value <= 0){
        [nd setInteger:0 forKey:@"gemPotValue"];
    }
    return value;
    
}
+(void)addGems: (int)amount scene:(SKSpriteNode*)s{
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:([self getGems]+amount) forKey:@"gemPotValue"];
    [gems removeMiniGems:1];
    [gemInteractionUI refreshLabelNodes:s];
    
    if([self getGems] == 15){
        [gemInteractionUI potAnimation:s gemValue:[self getGems]];
        [self removeGems:15];
        [gemInteractionUI refreshLabelNodes:s];
    }else {
        [gemInteractionUI potAnimation:s gemValue:[self getGems]];
        [gemInteractionUI refreshLabelNodes:s];
    }
}
+(void)removeGems: (int)amount {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:([self getGems]-amount) forKey:@"gemPotValue"];
}
+(NSString*)getGemsAsString {
    return [NSString stringWithFormat:@"%d", [self getGems]];
}
@end
