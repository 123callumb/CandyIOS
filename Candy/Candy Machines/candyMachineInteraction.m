//
//  candyMachineInteraction.m
//  Candy
//
//  Created by Callum Beckwith on 04/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "candyMachineInteraction.h"
#import "candyMachines.h"
#import "candyMachineValues.h"
#import "candyMachineUI.h"

@implementation candyMachineInteraction
+(void)onCandyMachineTouch: (SKSpriteNode*)machine scene:(SKScene*)s {
    for(int i = 0; i <= [candyMachines getCandyMachinesUnlocked] - 1; i++){
        if([machine.name isEqualToString:[NSString stringWithFormat:@"candyMachine_Number_%d", i]]){
            NSLog(@"Candy Machine %d was touched", i);
            [candyMachineUI createCandyMachineUIWithID:i scene:s];
        }
    }
}
+(void)animateAllCandyMachinesOnTap: (SKScene*)s {
    for(int i = 0; i <= [candyMachines getCandyMachinesUnlocked] - 1; i++){
        
        SKSpriteNode *floor = (SKSpriteNode*)[s childNodeWithName:@"levelFloor"];
        SKSpriteNode *workstation = (SKSpriteNode*)[floor childNodeWithName:[NSString stringWithFormat:@"workstation_%d", i]];
        SKSpriteNode *machine = (SKSpriteNode*)[workstation childNodeWithName:[NSString stringWithFormat:@"candyMachine_Number_%d", i]];
        
        machine.texture = [SKTexture textureWithImageNamed:[candyMachineValues getCandyMachineTextureSecondState:i]];
        
        SKAction *animationDuration = [SKAction waitForDuration:0.1];
        
        [machine runAction:animationDuration completion:^{
            machine.texture = [SKTexture textureWithImageNamed:[candyMachineValues getCandyMachineTextureFirstState:i]];
        }];
    }
}
@end
