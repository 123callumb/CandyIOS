//
//  slot.h
//  Candy
//
//  Created by Callum Beckwith on 19/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface slot : SKSpriteNode
+(void)slot: (SKSpriteNode*)s slotNumber:(int)noOfSlot;
+(float)calculateSlotX: (int)slotNO invSprite:(SKSpriteNode*)s;
+(void)refreshSlots: (SKSpriteNode*)s ;
@end
