//
//  candyMachineCreator.h
//  Candy
//
//  Created by Callum Beckwith on 04/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface candyMachineCreator : SKSpriteNode
+(void)createCandyMachineWithID: (int)candyMachineID position:(CGPoint)pos scale:(float)scale attatchingSprite:(SKSpriteNode*)s;
@end
