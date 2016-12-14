//
//  skPacketOpener.m
//  Candy
//
//  Created by Callum Beckwith on 13/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "skPacketOpener.h"
#import "packetUIButtons.h"

@implementation skPacketOpener
+(void)addOpenerButton: (SKScene*)s{
    SKSpriteNode *openButon = [SKSpriteNode spriteNodeWithImageNamed:@"openPacket"];
    openButon.xScale = 0.9;
    openButon.yScale = 0.9;
    openButon.name = @"buttonPacketOpen";
    [s addChild:openButon];
    [self addOpener:s];
}
+(void)onOpenPress: (SKNode*)n {
    if([n.name isEqualToString:@"buttonPacketOpen"]){
        [packetUIButtons buttonAnimation:(SKSpriteNode*)n action:[SKAction runBlock:^{
         
        }]];
    }
}
+(void)addOpener: (SKScene*)s {
    SKSpriteNode *openTray = [SKSpriteNode spriteNodeWithImageNamed:@"packetOpenTray"];
    openTray.position = CGPointMake(0, s.frame.size.height/5);
    openTray.xScale = 0.5;
    openTray.yScale = 0.5;
    
    SKSpriteNode *packetContents = [SKSpriteNode spriteNodeWithImageNamed:@"packetContentBb"];
    packetContents.position = CGPointMake(0, -s.frame.size.height/9);
    packetContents.xScale = 0.46;
    packetContents.yScale = 0.46;
    
    [s addChild:packetContents];
    [s addChild:openTray];
}
@end
