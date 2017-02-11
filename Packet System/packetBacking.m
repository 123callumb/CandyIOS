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
    
    SKLabelNode *swipe = [SKLabelNode labelNodeWithText:@"Swipe left and right to view packs!"];
    swipe.fontName = @"Coder's-Crux";
    swipe.fontColor = [SKColor blackColor];
    swipe.fontSize = 50;
    swipe.position = CGPointMake(0, - s.frame.size.height/2 + swipe.frame.size.height);
    
    [s addChild:backing];
    [s addChild:header];
    [s addChild:close];
    [s addChild:swipe];
}
+(void)addOpenerBacking: (SKScene*)s {
    SKSpriteNode *backing = [SKSpriteNode spriteNodeWithImageNamed:@"packetsOpenBG"];
    backing.size = CGSizeMake(s.frame.size.width, s.frame.size.height);
    
    SKSpriteNode *sweetBottom = [SKSpriteNode spriteNodeWithImageNamed:@"sweetCollection"];
    sweetBottom.size = CGSizeMake(s.frame.size.width, s.frame.size.height/12);
    sweetBottom.position = CGPointMake(0, -s.frame.size.height/2 + sweetBottom.frame.size.height/2);
    
    SKSpriteNode *title = [SKSpriteNode spriteNodeWithImageNamed:@"openTitle"];
    title.size = CGSizeMake(s.frame.size.width/1.4, s.frame.size.height/8);
    title.position = CGPointMake(0, s.frame.size.height/2 - title.frame.size.height);
    
    [s addChild:backing];
    [s addChild:sweetBottom];
    [s addChild:title];
}
+(void)addCongrats: (SKScene*)s {
    SKLabelNode *swipe = [SKLabelNode labelNodeWithText:@"Congratulations!"];
    swipe.fontName = @"Coder's-Crux";
    swipe.fontColor = [SKColor blackColor];
    swipe.fontSize = 100;
    swipe.position = CGPointMake(0, - s.frame.size.height/5);
    swipe.xScale = 0.1;
    swipe.yScale = 0.1;
    
    SKLabelNode *cont = [SKLabelNode labelNodeWithText:@"Tap to Continue"];
    cont.fontName = @"Coder's-Crux";
    cont.fontColor = [SKColor blackColor];
    cont.fontSize = 50;
    cont.position = CGPointMake(0, - s.frame.size.height/4);
    cont.alpha = 0.0;
    
    SKAction *growIn = [SKAction scaleTo:1 duration:0.4];
    SKAction *fadeIn = [SKAction fadeInWithDuration:0.6];
    
    [s addChild:swipe];
    [s addChild:cont];

    [swipe runAction:growIn];
    [cont runAction:fadeIn];
    
}
@end
