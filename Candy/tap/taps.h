//
//  taps.h
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface taps : SKSpriteNode
+(void)onPressed: (SKScene *)s location:(CGPoint)p view:(UIView*)v;
+(void)onRelease: (SKScene*)s;
+(void)onMovement: (SKScene*)s location:(CGPoint)p node:(SKNode*)n;
@end
