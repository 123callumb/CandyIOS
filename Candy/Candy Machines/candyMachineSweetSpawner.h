//
//  candyMachineSweetSpawner.h
//  Candy
//
//  Created by Callum Beckwith on 07/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface candyMachineSweetSpawner : SKSpriteNode
+(void)createSweetsFromMachine: (SKScene*)s machineID:(int)machineNumber machinePosition:(CGPoint)pos;
@end
