//
//  skinColour.h
//  Character_Maker
//
//  Created by Killian Comerford on 25/11/2016.
//  Copyright © 2016 Killian Comerford. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface skinColour : SKSpriteNode
+(void)SpawnTextures:(SKScene*)s;
+(void)touchDown:(SKSpriteNode*)s location:(CGPoint)point;
+(void)touchUp;
@end
