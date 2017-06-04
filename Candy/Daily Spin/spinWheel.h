//
//  spinWheel.h
//  Candy
//
//  Created by Callum Beckwith on 12/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface spinWheel : SKSpriteNode
+(void)addWheel: (SKScene*)s;
+(void)onBoxInteraction:(SKScene*)s box:(SKSpriteNode*)box;
@end
