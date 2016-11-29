//
//  character_clothes.h
//  Character_Maker
//
//  Created by Killian Comerford on 24/11/2016.
//  Copyright © 2016 Killian Comerford. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface character_clothes : SKSpriteNode
+(void)initializeSprites:(SKScene*)s imageState:(int)img;
+(void)onTouch:(SKNode*)n;
@end
