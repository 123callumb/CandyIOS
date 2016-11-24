//
//  slot.m
//  Candy
//
//  Created by Callum Beckwith on 19/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "slot.h"
#import "sweetData.h"

@implementation slot
+(id)slot: (NSString*)name {
    SKSpriteNode *box = [SKSpriteNode spriteNodeWithImageNamed:@"invBox2"];
    box.zPosition = 10;
    box.anchorPoint = CGPointMake(0.5, 0.5);
    SKLabelNode *boxName = [SKLabelNode labelNodeWithText:name];
    [box addChild:boxName];
    boxName.fontName = @"Coder's-Crux";
    boxName.fontSize = 150;
    boxName.fontColor = [UIColor blackColor];
    boxName.position = CGPointMake(0, -box.frame.size.height/2.8);
    return box;
}
@end
