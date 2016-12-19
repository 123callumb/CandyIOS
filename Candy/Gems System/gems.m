//
//  gems.m
//  Candy
//
//  Created by Callum Beckwith on 19/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "gems.h"

@implementation gems

//Regular Gems

+(int)getGems {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    int value = (int)[nd integerForKey:@"gemValue"];
    
    if(!value || value <= 0){
        [nd setInteger:0 forKey:@"gemValue"];
    }
    return value;

}
+(void)addGems: (int)amount {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:([self getGems]+amount) forKey:@"gemValue"];
}
+(void)removeGems: (int)amount {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:([self getGems]-amount) forKey:@"gemValue"];
}
+(NSString*)getGemsAsString {
    return [NSString stringWithFormat:@"%d", [self getGems]];
}

//Mini Gems

+(int)getMiniGems {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    int value = (int)[nd integerForKey:@"miniGemValue"];
    
    if(!value || value <= 0){
        [nd setInteger:0 forKey:@"miniGemValue"];
    }
    return value;
    
}
+(void)addMiniGems: (int)amount {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:([self getGems]+amount) forKey:@"miniGemValue"];
}
+(void)removeMiniGems: (int)amount {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:([self getGems]-amount) forKey:@"miniGemValue"];
}
+(NSString*)getMiniGemsAsString {
    return [NSString stringWithFormat:@"%d", [self getGems]];
}
@end
