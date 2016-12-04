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
+(int)getSlotsUnlocked;
+(int)getSelectedSlot;
@end
