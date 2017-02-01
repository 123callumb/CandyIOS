//
//  packetBacking.m
//  Candy
//
//  Created by Callum Beckwith on 01/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "packetBacking.h"

@implementation packetBacking
+(void)addBacking: (SKScene*)s {
    SKSpriteNode *backing = [SKSpriteNode spriteNodeWithImageNamed:@"invBG"];
    backing.size = CGSizeMake(s.frame.size.width, s.frame.size.height);
    
    SKSpriteNode *header = [SKSpriteNode spriteNodeWithImageNamed:@"ownedPacketsHeader"];
    header.size = CGSizeMake(s.frame.size.width, s.frame.size.height/4);
    header.position = CGPointMake(0, s.frame.size.height/2 - header.size.height/2);
    
    SKSpriteNode *close = [SKSpriteNode spriteNodeWithImageNamed:@"crossButton"];
    close.xScale = 0.4;
    close.yScale = 0.4;
    close.position = CGPointMake(-s.frame.size.width/2 + close.frame.size.width/2, s.frame.size.height/2 - close.frame.size.height/2 );
    close.name = @"closeButton";
    
    [s addChild:backing];
    [s addChild:header];
    [s addChild:close];
}
@end
