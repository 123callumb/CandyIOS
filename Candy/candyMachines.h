//
//  candyMachines.h
//  Candy
//
//  Created by Killian Comerford on 02/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface candyMachines : SKSpriteNode
+(void)addCandyMachine: (SKSpriteNode*)s scale:(float)scale position:(CGPoint)pos;
+(void)onTouch:(SKScene*)n;
@end
