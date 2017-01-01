//
//  gemGemeratorGui.h
//  Candy
//
//  Created by Callum Beckwith on 01/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface gemGemeratorGui : SKSpriteNode
+(void)createGemMenu: (SKScene*)s;
+(void)onDoneTouch: (SKSpriteNode*)s scene:(SKScene*)sk;
@end
