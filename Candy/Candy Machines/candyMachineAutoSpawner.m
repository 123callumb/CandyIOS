//
//  candyMachineAutoSpawner.m
//  Candy
//
//  Created by Callum Beckwith on 10/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "candyMachineAutoSpawner.h"
#import "candyMachines.h"
#import "coinSpawner.h"
#import "candyMachineSweetSpawner.h"

@implementation candyMachineAutoSpawner
+(int)retrunSecondsBasedOnUpgValue: (int)upgValue {
    if(upgValue != 0){
        return 11 - upgValue;
    }
    else return 100;
}
+(void)startAutoCandyMachines: (SKScene*)s {

    for (int i = 0 ; i <= [candyMachines getCandyMachinesUnlocked] - 1; i++) {
        SKSpriteNode *workstation = (SKSpriteNode*)[s childNodeWithName:[NSString stringWithFormat:@"workstation_%d", i]];
        
        SKAction *machineDelay =
        [SKAction waitForDuration:[self retrunSecondsBasedOnUpgValue:[candyMachines getCandyMachineUpgradeValueAtID:i]]];
        
        SKAction *sweetSpaner = [SKAction runBlock:^{
            [candyMachineSweetSpawner createSweetsFromMachine:s machineID:i machinePosition:workstation.position];
        }];
        
        SKAction *sequence = [SKAction sequence:@[machineDelay, sweetSpaner]];
        
        SKAction *repeat = [SKAction repeatActionForever:sequence];
        
        [workstation runAction:repeat];
    
        
    }
}
@end
