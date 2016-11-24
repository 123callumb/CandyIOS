//
//  determineSweetTap.h
//  Candy
//
//  Created by Callum Beckwith on 24/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface determineSweetTap : SKSpriteNode
+(void)spawn: (SKScene *)s location:(CGPoint)p;
+(int)getInventoryUnlocked;
@end
