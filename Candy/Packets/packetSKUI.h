//
//  packetSKUI.h
//  Candy
//
//  Created by Callum Beckwith on 11/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface packetSKUI : SKSpriteNode
+(void)addPacketUI: (SKScene*)s;
+(void)onBackTouch: (SKScene*)s obj:(SKNode*)n;
@end
