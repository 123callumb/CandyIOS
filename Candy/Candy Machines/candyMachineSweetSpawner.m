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
#import "optimiseCandyMachineData.h"

@implementation candyMachineSweetSpawner
+(void)createSweetsFromMachine: (SKScene*)s machineID:(int)machineNumber machinePosition:(CGPoint)pos{
        for (int i = 0; i <= [candyMachines getCandyMachineSlotValueAtID:machineNumber]; i++) {
            NSString *sweetTextureName =  [optimiseCandyMachineData returnTextureAtMachineID:machineNumber slotNumber:i];
            SKSpriteNode *sweet = [self createSweetSprite:s pos:pos texture:sweetTextureName];
            if(![sweetTextureName isEqualToString:@"emptyDraw"]){
                [nodeToParticle particleFlyAnimation:sweet scene:s scaleNo:0.2];
                [money addBalance:[sweetValueCalculation calculateSkValue:sweet]];
                SKSpriteNode *coinbar = (SKSpriteNode*)[s childNodeWithName:@"UIcoinBar"];
                SKSpriteNode *workstation = (SKSpriteNode*)[s childNodeWithName:[NSString stringWithFormat:@"workstation_%d", machineNumber]];
                [coinSpawner spriteToSpriteSpawner:workstation sprite2:coinbar scene:s];

            }
    }
}
+(id)createSweetSprite: (SKScene*)s pos:(CGPoint)p texture:(NSString*)tex {
    SKSpriteNode *sweet = [SKSpriteNode spriteNodeWithImageNamed:tex];
    sweet.position = p;
    sweet.zPosition = 5;
    return sweet;
}
@end
