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
#import "candyMachineSlotData.h"
#import "candyMachineSweetSelector.h"

@implementation candyMachineUI

int machineSlotSelected = 3;

+(void)createCandyMachineUIWithID: (int)machineID scene:(SKScene*)s view:(UIView*)v {
    SKSpriteNode *mainUI = [SKSpriteNode spriteNodeWithImageNamed:@"candyMachineUI"];
    mainUI.xScale = 0.43;
    mainUI.yScale = 0.43;
    mainUI.position = CGPointMake(0, -s.frame.size.height);
    
    float mainW = mainUI.frame.size.width;
    float mainH = mainUI.frame.size.height;
    
    SKSpriteNode *candyMachine = [SKSpriteNode spriteNodeWithImageNamed:[candyMachineValues getCandyMachineTextureFirstState:machineID]];
    candyMachine.position = CGPointMake(-mainW/2.5, mainH/1.5);
    candyMachine.xScale = 3;
    candyMachine.yScale = 3;
    
    SKSpriteNode *upgradeCostBar = [SKSpriteNode spriteNodeWithImageNamed:@"machineCoinUpgradePrice"];
    upgradeCostBar.position = CGPointMake(-mainW/2.4, mainH/6);
    
    SKSpriteNode *upgradeButton = [SKSpriteNode spriteNodeWithImageNamed:@"machineUpgradeButton"];
    upgradeButton.position = CGPointMake(-mainW/2.4, -mainH/14);
    
    SKSpriteNode *slotUpgradeCostBar = [SKSpriteNode spriteNodeWithImageNamed:@"gemUpgradePrice"];
    slotUpgradeCostBar.position = CGPointMake(-mainW/2.4, -mainH/3.2);
    
    SKSpriteNode *slotUpgradeButton = [SKSpriteNode spriteNodeWithImageNamed:@"machineSlotUpgradeButton"];
    slotUpgradeButton.position = CGPointMake(-mainW/2.4, -mainH/1.82);
    
    SKLabelNode *upgradeCost = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    upgradeCost.fontColor = [SKColor blackColor];
    upgradeCost.fontSize = 120.0f;
    upgradeCost.text = [NSString stringWithFormat:@"%d", [candyMachineValues upgradePrices:[candyMachines getCandyMachineUpgradeValueAtID:machineID]]];
    upgradeCost.position = CGPointMake(0, -upgradeCost.frame.size.height/2);
    [upgradeCostBar addChild:upgradeCost];
    
    SKLabelNode *slotCost = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    slotCost.fontColor = [SKColor blackColor];
    slotCost.fontSize = 120.0f;
    slotCost.text = [NSString stringWithFormat:@"%d", [candyMachineValues slotPrices:[candyMachines getCandyMachineSlotValueAtID:machineID]]];
    slotCost.position = CGPointMake(0, -slotCost.frame.size.height/2);
    [slotUpgradeCostBar addChild:slotCost];
    
    SKSpriteNode *backButton = [SKSpriteNode spriteNodeWithImageNamed:@"backButton"];
    backButton.position = CGPointMake(0, -mainH + backButton.frame.size.height/1.4);
    backButton.name = @"machineBack";
    
    [mainUI addChild:candyMachine];
    [mainUI addChild:upgradeCostBar];
    [mainUI addChild:upgradeButton];
    [mainUI addChild:slotUpgradeCostBar];
    [mainUI addChild:slotUpgradeButton];
    [mainUI addChild:backButton];
    [s addChild:mainUI];
    

    SKAction *slideIn = [SKAction moveToY:-s.frame.size.height/20 duration:0.3];
    [self addCandyMachineSlotUIWithID:machineID view:v];
    [mainUI runAction:slideIn];
    
}
//Need to create a slot creator to minimise this code!
+(void)addCandyMachineSlotUIWithID: (int)machineID view:(UIView*)v {
    UIView *slots = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width/1.76, v.frame.size.height, v.frame.size.width/3, v.frame.size.height/1.8)];
    
    UIImage *sweetDrawSlot = [UIImage imageNamed:@"sweetDrawSlot"];
    
    float slotSquared = v.frame.size.width/2.97;
    
    UIImageView *slot0Bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, slotSquared, slotSquared)];
    UIImageView *slot1Bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, slotSquared, slotSquared, slotSquared)];
    UIImageView *slot2Bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, slotSquared * 2, slotSquared, slotSquared)];
  
    UIButton *slot0 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *slot1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *slot2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [slot0Bg setImage:sweetDrawSlot];
    [slot1Bg setImage:sweetDrawSlot];
    [slot2Bg setImage:sweetDrawSlot];
    
    NSString *slot0TextureString = [candyMachineSlotData getTextureFromSweetUUID:[candyMachineSlotData getCandyMachineSlotUUIDAtID:machineID slotID:0]];
    NSString *slot1TextureString = [candyMachineSlotData getTextureFromSweetUUID:[candyMachineSlotData getCandyMachineSlotUUIDAtID:machineID slotID:1]];
    NSString *slot2TextureString = [candyMachineSlotData getTextureFromSweetUUID:[candyMachineSlotData getCandyMachineSlotUUIDAtID:machineID slotID:2]];
    
    UIImage *slot0Texture = [UIImage imageNamed:slot0TextureString];
    UIImage *slot1Texture;
    UIImage *slot2Texture;
    
    [slot0Bg setUserInteractionEnabled:true];
    
    [slot0 addTarget:self action:@selector(onSlot1Press:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([candyMachines getCandyMachineSlotValueAtID:machineID] >= 1) {
        slot1Texture = [UIImage imageNamed:slot1TextureString];
        [slot1 setFrame:CGRectMake(0,  -slot0Bg.frame.size.height/20, slot0Bg.frame.size.width, slot0Bg.frame.size.height)];
    }else {
        slot1Texture = [UIImage imageNamed:@"padlock"];
        [slot1 setFrame:CGRectMake(slot0Bg.frame.size.width/2 - (slot0Bg.frame.size.width/2.5)/2,  slot0Bg.frame.size.height/2.3 - slot0Bg.frame.size.height/4, slot0Bg.frame.size.width/2.5, slot0Bg.frame.size.height/2)];
    }
    
    if ([candyMachines getCandyMachineSlotValueAtID:machineID] >= 2) {
        slot2Texture = [UIImage imageNamed:slot2TextureString];
        [slot2 setFrame:CGRectMake(0,  -slot0Bg.frame.size.height/20, slot0Bg.frame.size.width, slot0Bg.frame.size.height)];

    }else {
        slot2Texture = [UIImage imageNamed:@"padlock"];
        [slot2 setFrame:CGRectMake(slot0Bg.frame.size.width/2 - (slot0Bg.frame.size.width/2.5)/2,  slot0Bg.frame.size.height/2.3 - slot0Bg.frame.size.height/4, slot0Bg.frame.size.width/2.5, slot0Bg.frame.size.height/2)];
    }
    
    [slot0 setImage:slot0Texture forState:UIControlStateNormal];
    [slot1 setImage:slot1Texture forState:UIControlStateNormal];
    [slot2 setImage:slot2Texture forState:UIControlStateNormal];
    
    [slot0 setFrame:CGRectMake(0, -slot0Bg.frame.size.height/20, slot0Bg.frame.size.width, slot0Bg.frame.size.height)];
    
    [slot0Bg addSubview:slot0];
    [slot1Bg addSubview:slot1];
    [slot2Bg addSubview:slot2];
    
    [slots addSubview:slot0Bg];
    [slots addSubview:slot1Bg];
    [slots addSubview:slot2Bg];
    
    slots.tag = 11998;
    
    [v addSubview:slots];
    
    [UIView animateWithDuration:0.3 animations:^{
        slots.frame = CGRectMake(v.frame.size.width/1.76, v.frame.size.height/4.58, v.frame.size.width/3, v.frame.size.height/1.8);
    }];

}
+(void)onSlot1Press: (id)sender {
    NSLog(@"we get here?");
    UIButton *slot = (UIButton*)sender;
    UIView *v = [slot superview];
    UIView *v1 = [v superview];

    machineSlotSelected = 0;
    [candyMachineSweetSelector createInvSelectionUI:v1];

}
+(int)getSelectedSlot {
    return machineSlotSelected;
}
+(void)resetSelectedSlot {
    machineSlotSelected = 4;
}
@end
