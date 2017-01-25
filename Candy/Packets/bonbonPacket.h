//
//  bonbonPacket.h
//  Candy
//
//  Created by Callum Beckwith on 15/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface bonbonPacket : SKSpriteNode
+(void)addContentSection: (SKSpriteNode*)s;
+(void)createRandomSlider: (SKScene*)s yPos:(float)yVal;
+(int)getBrandValue;
+(void)upgradeBrandValue;
@end
