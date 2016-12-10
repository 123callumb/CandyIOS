//
//  packetUIButtons.h
//  Candy
//
//  Created by Callum Beckwith on 09/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface packetUIButtons : SKSpriteNode
+(void)addButtons: (SKSpriteNode*)s;
+(void)onButtonPress:(SKSpriteNode*)s scene:(SKScene*)sk;
@end
