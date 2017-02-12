//
//  settingsData.m
//  Candy
//
//  Created by Callum Beckwith on 12/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "settingsData.h"

@implementation settingsData
+(void)toggleMusic: (bool)onOff {
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    if(onOff == true){
        [nd setInteger:0 forKey:@"settings_music"];
    }
    if(onOff == false){
        [nd setInteger:1 forKey:@"settings_music"];
    }
    [nd synchronize];
}
+(int)isMusicEnabled {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd boolForKey:@"settings_music"];

}
+(void)toggleTips: (bool)onOff {
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    if(onOff == true){
        [nd setInteger:0 forKey:@"settings_tips"];
    }
    if(onOff == false){
        [nd setInteger:1 forKey:@"settings_tips"];
    }
    [nd synchronize];
}
+(int)isTipsEnabled {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd boolForKey:@"settings_tips"];
}
+(void)toggleFancyGraphics: (bool)onOff {
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    if(onOff == true){
        [nd setInteger:0 forKey:@"settings_fg"];
    }
    if(onOff == false){
        [nd setInteger:1 forKey:@"settings_fg"];
    }
    [nd synchronize];
}
+(int)isFancyGraphicsEnabled {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd boolForKey:@"settings_fg"];
}
@end
