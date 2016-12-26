//
//  bonbonPacket.m
//  Candy
//
//  Created by Callum Beckwith on 15/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "bonbonPacket.h"
#import "skPacketOpener.h"
#import "packetContentManager.h"

@implementation bonbonPacket
+(NSArray*)contentList {
    NSArray *content = [NSArray arrayWithObjects:@"mintbonbonPacket",
                    @"bonbonLimePacket",
                    @"cokebonbonPacket",
                    @"strawberrybonbonPacket",
                    @"bonbonLemonPacket",
                    @"bubblegumbonbonPacket",
                    @"bonbonTropicalPacket",
                    @"cherrybonbonPacket",
                    @"rainbowBonBonPacket",
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
