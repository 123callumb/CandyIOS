//
//  Save.h
//  Character_Maker
//
//  Created by Killian Comerford on 28/11/2016.
//  Copyright © 2016 Killian Comerford. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Save : SKSpriteNode
+(void)spawn:(SKScene*)s;
+(void)onTouch:(SKNode*)n scene:(SKScene*)s;

@end
