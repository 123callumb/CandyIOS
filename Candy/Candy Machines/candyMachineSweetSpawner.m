//
//  candyMachineSweetSpawner.m
//  Candy
//
//  Created by Callum Beckwith on 07/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "candyMachineSweetSpawner.h"
#import "candyMachineSlotData.h"
#import "nodeToParticle.h"
#import "candyMachines.h"
#import "money.h"
#import "sweetValueCalculation.h"

@implementation candyMachineSweetSpawner
+(void)createSweetsFromMachine: (SKScene*)s machineID:(int)machineNumber machinePosition:(CGPoint)pos{
    for (int i = 0; i <= [candyMachines getCandyMachineSlotValueAtID:machineNumber]; i++) {
        SKSpriteNode *sweet = [self createSweetSprite:s pos:pos machineID:machineNumber slotNo:i];
        [nodeToParticle particleFlyAnimation:sweet scene:s scaleNo:0.2];
        [money addBalance:[sweetValueCalculation calculateSkValue:sweet]];
    }
}
+(id)createSweetSprite: (SKScene*)s pos:(CGPoint)p machineID:(int)machineNumber slotNo:(int)slotID {
    NSString *sweetTextureName =  [candyMachineSlotData getTextureFromSweetUUID:[candyMachineSlotData getCandyMachineSlotUUIDAtID:machineNumber slotID:slotID]];
    SKSpriteNode *sweet = [SKSpriteNode spriteNodeWithImageNamed:sweetTextureName];
    sweet.position = p;
    sweet.zPosition = 1;
    return sweet;
}
@end
