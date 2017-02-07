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
#import "candyMachineSweetSpawner.h"

@implementation candyMachineInteraction

int currentSelectedMachine = 1337;

+(void)onCandyMachineTouch: (SKSpriteNode*)machine scene:(SKScene*)s view:(UIView*)v{
    for(int i = 0; i <= [candyMachines getCandyMachinesUnlocked] - 1; i++){
        if([machine.name isEqualToString:[NSString stringWithFormat:@"candyMachine_Number_%d", i]]){
            NSLog(@"Candy Machine %d was touched", i);
            [candyMachineUI createCandyMachineUIWithID:i scene:s view:v];
            currentSelectedMachine = i;
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
        [candyMachineSweetSpawner createSweetsFromMachine:s machineID:i machinePosition:CGPointMake(machine.position.x, machine.position.y - machine.frame.size.height/2)];
        [machine runAction:animationDuration completion:^{
            machine.texture = [SKTexture textureWithImageNamed:[candyMachineValues getCandyMachineTextureFirstState:i]];
        }];
    }
}
+(int)getCurrentSelectedMachine {
    return currentSelectedMachine;
}
+(void)resetCurrentSelectedMachine {
    currentSelectedMachine = 1337;
}
+(void)onBackButton: (SKSpriteNode*)s view:(UIView*)v {
    if([s.name isEqualToString:@"machineBack"]){
        SKSpriteNode *mainSkUI = (SKSpriteNode*)[s parent];
        UIView *slots = [v viewWithTag:11998];
        
        [UIView animateWithDuration:0.3 animations:^{
            [slots setFrame:CGRectMake(v.frame.size.width/1.76, v.frame.size.height, v.frame.size.width/3, v.frame.size.height/1.8)];
        } completion:^(BOOL finished){
            [slots removeFromSuperview];
        }];
        
        SKAction *slideAway = [SKAction moveToY:-[mainSkUI parent].frame.size.height duration:0.3];
        [mainSkUI runAction:slideAway completion:^{
                [mainSkUI removeFromParent];
        }];

        [self resetCurrentSelectedMachine];
    }
}
@end
