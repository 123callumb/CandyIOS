//
//  chewPacket.m
//  Candy
//
//  Created by Callum Beckwith on 18/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "chewPacket.h"
#import "packetContentManager.h"

@implementation chewPacket
+(NSArray*)contentList {
    NSArray *content = [NSArray arrayWithObjects:@"chewOrangePacket",
                        @"chewCherryPacket",
                        @"chewVanillaPacket",
                        @"chewBubblegumPacket",
                        @"chewApplePacket",
                        @"chewSourLimePacket",
                        @"chewCandyflossPacket",
                        @"chewBananaPacket",
                        @"chewFizzyColaPacket",
                        nil];
    return content;
}

+(void)addContentSection: (SKSpriteNode*)s {
    NSArray *content = [self contentList];
    [packetContentManager createContentPane:s contentList:content];
}

+(void)createRandomSlider: (SKScene*)s yPos:(float)yVal {
    [packetContentManager createSlider:s yPos:yVal sweetList:[self contentList]];
}
+(int)getBrandValue {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd integerForKey:@"chew_brand_trend"] + 1;
}
+(void)upgradeBrandValue {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:[self getBrandValue]+1 forKey:@"chew_brand_trend"];
}
@end
