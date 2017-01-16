//
//  sparks.h
//  Candy
//
//  Created by Callum Beckwith on 14/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface sparks : SKSpriteNode
+(void)createSparks: (CGPoint)pos scene:(SKScene*)s;
+(void)createSpriteSplosion:(SKScene*)s nodeAmount:(int)nAmount pos:(CGPoint)p;
@end
