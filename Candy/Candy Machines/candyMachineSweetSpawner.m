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
#import "coinSpawner.h"

@implementation candyMachineSweetSpawner
+(void)createSweetsFromMachine: (SKScene*)s machineID:(int)machineNumber machinePosition:(CGPoint)pos{
        for (int i = 0; i <= [candyMachines getCandyMachineSlotValueAtID:machineNumber]; i++) {
            SKSpriteNode *sweet = [self createSweetSprite:s pos:pos machineID:machineNumber slotNo:i];
            NSString *sweetTexture = [NSString stringWithFormat:@"%@", sweet.texture];
            if(![sweetTexture isEqualToString:@"<SKTexture> 'emptyDraw' (280 x 280)"]){
                [nodeToParticle particleFlyAnimation:sweet scene:s scaleNo:0.2];
                [money addBalance:[sweetValueCalculation calculateSkValue:sweet]];
                SKSpriteNode *coinbar = (SKSpriteNode*)[s childNodeWithName:@"UIcoinBar"];
                SKSpriteNode *workstation = (SKSpriteNode*)[s childNodeWithName:[NSString stringWithFormat:@"workstation_%d", machineNumber]];
                [coinSpawner spriteToSpriteSpawner:workstation sprite2:coinbar scene:s];

            }
    }
}
+(id)createSweetSprite: (SKScene*)s pos:(CGPoint)p machineID:(int)machineNumber slotNo:(int)slotID {
    NSString *sweetTextureName =  [candyMachineSlotData getTextureFromSweetUUID:[candyMachineSlotData getCandyMachineSlotUUIDAtID:machineNumber slotID:slotID]];
    SKSpriteNode *sweet = [SKSpriteNode spriteNodeWithImageNamed:sweetTextureName];
    sweet.position = p;
    sweet.zPosition = 5;
    return sweet;
}
@end
