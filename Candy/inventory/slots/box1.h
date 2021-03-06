//
//  box1.h
//  Candy
//
//  Created by Callum Beckwith on 19/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface box1 : SKSpriteNode
+(void)addbox:(SKSpriteNode*)s;
+(long)getSlotsUnlocked;
+(int)getSelectedSlot;
+(void)onSlotClick: (SKSpriteNode*)s scene:(SKScene*)sk;
+(void)setUnlockedSlots:(int)value;
@end
