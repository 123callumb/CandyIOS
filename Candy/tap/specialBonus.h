//
//  specialBonus.h
//  Candy
//
//  Created by Callum Beckwith on 24/05/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface specialBonus : SKSpriteNode
+(void)spawnSpecialItem:(SKScene*)s;
+(void)onSpecialBonus:(SKSpriteNode*)s onScene:(SKScene*)sc;
@end
