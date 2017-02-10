//
//  eggPacket.h
//  Candy
//
//  Created by Callum Beckwith on 10/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface eggPacket : SKSpriteNode
+(NSArray*)contentList;
+(void)addContentSection: (SKSpriteNode*)s;
+(void)createRandomSlider: (SKScene*)s yPos:(float)yVal;
+(int)getBrandValue;
+(void)upgradeBrandValue;
@end
