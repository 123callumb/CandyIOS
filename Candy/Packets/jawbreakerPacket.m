//
//  jawbreakerPacket.m
//  Candy
//
//  Created by Callum Beckwith on 18/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "jawbreakerPacket.h"
#import "packetContentManager.h"

@implementation jawbreakerPacket
+(NSArray*)contentList {
    NSArray *content = [NSArray arrayWithObjects:@"jawbreakerLiquoricePacket",
                        @"jawbreakerLimePacket",
                        @"jawbreakerLemonPacket",
                        @"jawbreakerBlueberryPacket",
                        @"jawbreakerStrawberryPacket",
                        @"jawbreakerOrangePacket",
                        @"jawbreakerCandyflossPacket",
                        @"jawbreakerBubblegumPacket",
                        @"jawbreakerWatermelonPacket",
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
    return (int)[nd integerForKey:@"jawbreaker_brand_trend"] + 1;
}
+(void)upgradeBrandValue {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:[self getBrandValue]+1 forKey:@"jawbreaker_brand_trend"];
}
@end
