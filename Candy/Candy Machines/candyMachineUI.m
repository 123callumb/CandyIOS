//
//  candyMachineUI.m
//  Candy
//
//  Created by Callum Beckwith on 05/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "candyMachineUI.h"
#import "candyMachines.h"
#import "candyMachineValues.h"

@implementation candyMachineUI
+(void)createCandyMachineUIWithID: (int)machineID scene:(SKScene*)s {
    SKSpriteNode *mainUI = [SKSpriteNode spriteNodeWithImageNamed:@"candyMachineUI"];
    mainUI.xScale = 0.43;
    mainUI.yScale = 0.43;
    mainUI.position = CGPointMake(0, -s.frame.size.height/8);
    
    float mainW = mainUI.frame.size.width;
    float mainH = mainUI.frame.size.height;
    
    SKSpriteNode *candyMachine = [SKSpriteNode spriteNodeWithImageNamed:[candyMachineValues getCandyMachineTextureFirstState:machineID]];
    candyMachine.position = CGPointMake(-mainW/3, mainH/2);
    candyMachine.xScale = 3;
    candyMachine.yScale = 3;
    
    SKSpriteNode *upgradeCostBar = [SKSpriteNode spriteNodeWithImageNamed:@"machineCoinUpgradePrice"];
    upgradeCostBar.position = CGPointMake(-mainW/2, mainH/10);
    
    SKSpriteNode *upgradeButton = [SKSpriteNode spriteNodeWithImageNamed:@"machineUpgradeButton"];
    upgradeButton.position = CGPointMake(-mainW/2, 0);
    
    SKSpriteNode *slotUpgradeCostBar = [SKSpriteNode spriteNodeWithImageNamed:@"gemUpgradePrice"];
    slotUpgradeCostBar.position = CGPointMake(-mainW/2, -mainH/10);
    
    SKSpriteNode *slotUpgradeButton = [SKSpriteNode spriteNodeWithImageNamed:@"machineSlotUpgradeButton"];
    slotUpgradeButton.position = CGPointMake(-mainW/2, mainH/8);
    
    SKLabelNode *upgradeCost = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    upgradeCost.fontColor = [SKColor blackColor];
    upgradeCost.fontSize = 50.0f;
    upgradeCost.text = [NSString stringWithFormat:@"%d", [candyMachineValues upgradePrices:[candyMachines getCandyMachineUpgradeValueAtID:machineID]]];
    [upgradeCostBar addChild:upgradeCost];
    
    SKLabelNode *slotCost = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    slotCost.fontColor = [SKColor blackColor];
    slotCost.fontSize = 50.0f;
    slotCost.text = [NSString stringWithFormat:@"%d", [candyMachineValues upgradePrices:[candyMachines getCandyMachineSlotValueAtID:machineID]]];
    [slotUpgradeCostBar addChild:slotCost];
    
    SKSpriteNode *backButton = [SKSpriteNode spriteNodeWithImageNamed:@"backButton"];
    backButton.position = CGPointMake(0, -mainH/2 + backButton.frame.size.height/3);
    
    [mainUI addChild:candyMachine];
    [mainUI addChild:upgradeCostBar];
    [mainUI addChild:upgradeButton];
    [mainUI addChild:slotUpgradeCostBar];
    [mainUI addChild:slotUpgradeButton];
    [mainUI addChild:backButton];
    [s addChild:mainUI];
    
}
@end
