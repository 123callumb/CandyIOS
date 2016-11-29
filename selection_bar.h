//
//  selection_bar.h
//  Character_Maker
//
//  Created by Killian Comerford on 24/11/2016.
//  Copyright © 2016 Killian Comerford. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface selection_bar : SKSpriteNode
+(void)spawn:(SKScene*)s;
+(void)initialize;
+(void)onTouch:(SKNode*)n imgst:(int)state;
@end
