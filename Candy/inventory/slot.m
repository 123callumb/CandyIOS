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
+(void)slot: (SKSpriteNode*)s slotNumber:(int)noOfSlot {
    
    SKSpriteNode *slot = [SKSpriteNode spriteNodeWithImageNamed:@"slotButtonGreen"];
    SKSpriteNode *lock = [SKSpriteNode spriteNodeWithImageNamed:@"padlock"];
    lock.position = CGPointMake(0, slot.frame.size.height/12);
    slot.position = CGPointMake([self calculateSlotX:noOfSlot invSprite:s], s.frame.size.height/2.4);
    
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
        slotNo.name = slot.name;
        if (noOfSlot == [box1 getSelectedSlot]) {
            slotNo.position = CGPointMake(0, -slot.frame.size.height/5);
        }
        [slot addChild:slotNo];
    }
    slot.position = CGPointMake([self calculateSlotX:noOfSlot invSprite:s], s.frame.size.height/2.4);
    [s addChild:slot];
}
+(float)calculateSlotX: (int)slotNO invSprite:(SKSpriteNode*)s {
    if(slotNO == 1){
        return -s.frame.size.width/1.35;
    }
    if(slotNO == 2){
        return -s.frame.size.width/2.8;
    }
    if(slotNO == 3){
        return 0;
    }
    if(slotNO == 4){
        return s.frame.size.width/2.8;
    }
    if(slotNO == 5){
        return s.frame.size.width/1.35;
    }else{
        return 0;
    }
}
+(void)refreshSlots: (SKSpriteNode*)s {
    for(int i = 1; i <= 5; i++){
        SKSpriteNode *slot = (SKSpriteNode*)[s childNodeWithName:[NSString stringWithFormat:@"sweetSlot%d", i]];
        [slot removeFromParent];
        [self slot:s slotNumber:i];
    }
}
@end
