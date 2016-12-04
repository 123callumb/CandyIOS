//
//  slot.m
//  Candy
//
//  Created by Callum Beckwith on 19/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "slot.h"
#import "sweetData.h"
#import "box1.h"

@implementation slot
+(void)slot: (SKSpriteNode*)s slotNumber:(int)noOfSlot pos:(CGPoint)position {
    
    SKSpriteNode *slot = [SKSpriteNode spriteNodeWithImageNamed:@"slotButtonGreen"];
    SKSpriteNode *lock = [SKSpriteNode spriteNodeWithImageNamed:@"padlock"];
    lock.position = CGPointMake(0, slot.frame.size.height/12);
    
    slot.name = [NSString stringWithFormat:@"sweetSlot%d" , noOfSlot];
    
    if([box1 getSelectedSlot] == noOfSlot){
        slot.texture = [SKTexture textureWithImageNamed:@"slotButtonGreenPressed"];
    }
    if(noOfSlot > [box1 getSlotsUnlocked]){
        [slot addChild:lock];
        slot.texture = [SKTexture textureWithImageNamed:@"slotButtonGray"];
    }else {
        SKLabelNode *slotNo = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
        slotNo.text = [NSString stringWithFormat:@"%d", noOfSlot];
        slotNo.fontSize = 200;
        slotNo.fontColor = [SKColor blackColor];
        slotNo.position = CGPointMake(0, -slot.frame.size.height/8);
        if (noOfSlot == [box1 getSelectedSlot]) {
            slotNo.position = CGPointMake(0, -slot.frame.size.height/5);
        }
        [slot addChild:slotNo];
    }
    slot.position = position;
    [s addChild:slot];
}
+(void)refreshSlots {
    
}
@end
