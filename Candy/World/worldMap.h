//
//  worldMap.h
//  Candy
//
//  Created by Callum Beckwith on 15/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface worldMap : SKSpriteNode
+(void)addWorld:(SKScene*)s;
+(void)mapMovement:(UIPanGestureRecognizer*)state onScene:(SKScene*)s;
+(void)onBuldingInteraction:(SKSpriteNode*)building onView:(UIView*)v;
@end
