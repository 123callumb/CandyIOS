//
//  wrappedPacket.m
//  Candy
//
//  Created by Callum Beckwith on 18/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "wrappedPacket.h"
#import "packetContentManager.h"

@implementation wrappedPacket
+(NSArray*)contentList {
    NSArray *content = [NSArray arrayWithObjects:@"wrappedMintPacket",
                        @"wrappedLimePacket",
                        @"wrappedCoffePacket",
                        @"wrappedLemonPacket",
                        @"wrappedCherryPacket",
                        @"wrappedStrawberryPacket",
                        @"wrappedOrangePacket",
                        @"wrappedBlueberryPacket",
                        @"wrappedTropicalPacket",
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
@end
