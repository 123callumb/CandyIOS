//
//  box1.m
//  Candy
//
//  Created by Callum Beckwith on 19/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "box1.h"
#import "slot.h"

@implementation box1
+(void)addbox:(SKSpriteNode*)s {
    [self addbox1:s];
    [self addbox2:s];
    [self addbox3:s];
    [self addbox4:s];
    [self addCheekyBars:s];
}
+(void)addbox1:(SKSpriteNode*)s {
    SKSpriteNode *box = [slot slot:@"BOX 1"];
    box.position = CGPointMake(-s.frame.size.width/2.2, s.frame.size.height/4);
    box.name = @"box_1_1";
    [s addChild:box];
}
+(void)addbox2:(SKSpriteNode*)s; {
    SKSpriteNode *box = [slot slot:@"BOX 2"];
    box.position = CGPointMake(s.frame.size.width/2.2, s.frame.size.height/4);
    box.name = @"box_1_2";
    [s addChild:box];
}
+(void)addbox3:(SKSpriteNode*)s; {
    SKSpriteNode *box = [slot slot:@"BOX 3"];
    box.position = CGPointMake(-s.frame.size.width/2.2, -s.frame.size.height/2.1);
    box.name = @"box_1_3";
    [s addChild:box];
}
+(void)addbox4:(SKSpriteNode*)s; {
    SKSpriteNode *box = [slot slot:@"BOX 4"];
    box.position = CGPointMake(s.frame.size.width/2.2, -s.frame.size.height/2.1);
    box.name = @"box_1_4";
    [s addChild:box];
}
+(void)addCheekyBars: (SKSpriteNode*)s {
    SKSpriteNode *up = [SKSpriteNode spriteNodeWithImageNamed:@"upMenuBlue"];
    SKSpriteNode *down = [SKSpriteNode spriteNodeWithImageNamed:@"downMenuBlue"];
    up.position = CGPointMake(0, s.frame.size.height/1.4);
    down.position = CGPointMake(0, -s.frame.size.height/1.05);
    [s addChild:up];
    [s addChild:down];
}
@end
