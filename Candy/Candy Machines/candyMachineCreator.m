//
//  candyMachineCreator.m
//  Candy
//
//  Created by Callum Beckwith on 04/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "candyMachineCreator.h"
#import "candyMachines.h"
#import "candyMachineValues.h"

@implementation candyMachineCreator
+(void)createCandyMachineWithID: (int)candyMachineID position:(CGPoint)pos scale:(float)scale attatchingSprite:(SKSpriteNode*)s {
    NSString *machineTexture = [candyMachineValues getCandyMachineTextureFirstState:candyMachineID];
    
    SKSpriteNode *candyMachine = [SKSpriteNode spriteNodeWithImageNamed:machineTexture];
    
    candyMachine.name = [NSString stringWithFormat:@"candyMachine_Number_%d", candyMachineID];
    candyMachine.xScale = scale;
    candyMachine.yScale = scale;
    candyMachine.position = CGPointMake(s.position.x, s.position.y + candyMachine.frame.size.height/1.1);
    candyMachine.zPosition = 5;
    [s addChild:candyMachine];
}
@end
