//
//  gemInteractionUI.h
//  Candy
//
//  Created by Callum Beckwith on 01/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface gemInteractionUI : SKSpriteNode
+(void)potAnimation: (SKSpriteNode*)s gemValue:(int)gemNo;
+(void)addInteractionUI: (SKScene*)s;
+(void)onInteraction: (SKSpriteNode*)s pos:(CGPoint)loc;
+(void)refreshLabelNodes: (SKSpriteNode*)s;
@end
