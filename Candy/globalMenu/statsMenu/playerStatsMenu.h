//
//  playerStatsMenu.h
//  Candy
//
//  Created by Callum Beckwith on 30/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface playerStatsMenu : SKSpriteNode
+(void)createPStatsMenu: (SKScene*)s;
+(void)onDoneTouch: (SKSpriteNode*)s scene:(SKScene*)sk;
@end
