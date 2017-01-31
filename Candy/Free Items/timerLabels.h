//
//  timerLabels.h
//  Candy
//
//  Created by Callum Beckwith on 31/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface timerLabels : SKSpriteNode
+(void)addGemLabel: (SKSpriteNode*)s;
+(void)updateLabels: (SKScene*)s;
+(void)addCoinLabel: (SKSpriteNode*)s;
+(void)addMiniGemLabel: (SKSpriteNode*)s;
@end
