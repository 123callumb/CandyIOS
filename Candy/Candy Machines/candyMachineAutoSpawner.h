//
//  candyMachineAutoSpawner.h
//  Candy
//
//  Created by Callum Beckwith on 10/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface candyMachineAutoSpawner : SKSpriteNode
+(int)retrunSecondsBasedOnUpgValue: (int)upgValue;
+(void)startAutoCandyMachines: (SKScene*)s;
@end
