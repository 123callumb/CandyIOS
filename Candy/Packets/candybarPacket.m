//
//  candybarPacket.m
//  Candy
//
//  Created by Callum Beckwith on 10/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "candybarPacket.h"
#import "packetContentManager.h"

@implementation candybarPacket
+(NSArray*)contentList {
    NSArray *content = [NSArray arrayWithObjects:@"candybarChocolatePacket",
                        @"candybarDarkPacket",
                        @"candybarWhitePacket",
                        @"candybarWhiteDarkPacket",
                        @"candybarCaramelPacket",
                        @"candybarFruitPacket",
                        @"candybarMintPacket",
                        @"candybarYogurtPacket",
                        @"candybarPoppingPacket",
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
    return (int)[nd integerForKey:@"candybar_brand_trend"] + 1;
}
+(void)upgradeBrandValue {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:[self getBrandValue]+1 forKey:@"candybar_brand_trend"];
}
@end
