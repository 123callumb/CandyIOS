//
//  pencilPacket.m
//  Candy
//
//  Created by Callum Beckwith on 10/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "pencilPacket.h"
#import "packetContentManager.h"

@implementation pencilPacket
+(NSArray*)contentList {
    NSArray *content = [NSArray arrayWithObjects:@"pencilBananaPacket",
                        @"pencilApplePacket",
                        @"pencilLiquoricePacket",
                        @"pencilTropicalPacket",
                        @"pencilBlackcurrantPacket",
                        @"pencilCherryPacket",
                        @"pencilMangoPacket",
                        @"pencilStrawberryPacket",
                        @"pencilRaspberryPacket",
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
    return (int)[nd integerForKey:@"pencil_brand_trend"] + 1;
}
+(void)upgradeBrandValue {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:[self getBrandValue]+1 forKey:@"pencil_brand_trend"];
}


@end
