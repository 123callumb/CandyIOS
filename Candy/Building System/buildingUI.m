//
//  buildingUI.m
//  Candy
//
//  Created by Callum Beckwith on 03/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "buildingUI.h"
#import "buildingType.h"
#import "buildingUpgradeUI.h"
#import "quickSelectUI.h"
#import "statsMenuButtons.h"
#import "menuBacking.h"
#import "buttonAnimation.h"

@implementation buildingUI
+(void)createBuildingUI: (SKScene*)s  {
    SKSpriteNode *main = (SKSpriteNode *)[menuBacking createBacking];
    main.position = CGPointMake(0, -s.frame.size.height);
    main.name = @"menuInventory";
    
    [self addSkUI:main];
    [s addChild:main];
    
    SKAction  *slideUp = [SKAction moveToY:0 duration:0.3];
    [main runAction:slideUp];
}
+(void)addSkUI: (SKSpriteNode*)s {
    [self addBuildingIcon:s];
    [self addUpgradeBuildingButton:s];
    [self addBackbutton:s];
}
+(void)addBuildingIcon: (SKSpriteNode*)s {
    SKSpriteNode *building = [SKSpriteNode spriteNodeWithImageNamed:[buildingType getCurrentBuilding]];
    building.position = CGPointMake(0, s.frame.size.height/2.8);
    building.xScale = 0.5;
    building.yScale = 0.5;
    [s addChild:building];
}
+(void)addUpgradeBuildingButton: (SKSpriteNode*)s {
    SKSpriteNode *buildingUpgButton = [SKSpriteNode spriteNodeWithImageNamed:@"buildingButton"];
    buildingUpgButton.position = CGPointMake(0, s.frame.size.height/1.47);
    buildingUpgButton.name = @"menuBuildingUpgradeButton";
    SKLabelNode *placeTitle = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    placeTitle.text = [NSString stringWithFormat:@"UPGRADE %@", [buildingType getCurrentBuildingName]];
    placeTitle.fontSize = 150.0f;
    placeTitle.fontColor = [SKColor blackColor];
    placeTitle.position = CGPointMake(-buildingUpgButton.frame.size.width/16, -buildingUpgButton.frame.size.height/10);
    placeTitle.name = @"menuBuildingUpgradeButton";
    [buildingUpgButton addChild:placeTitle];
    [s addChild:buildingUpgButton];
}
+(void)addBackbutton: (SKSpriteNode*)s {
    SKSpriteNode *bak = [SKSpriteNode spriteNodeWithImageNamed:@"backButton"];
    bak.position = CGPointMake(0, -s.frame.size.height + bak.frame.size.height/2.5);
    bak.name = @"buidlingBack";
    [s addChild:bak];
}
+(void)onUpgTouch: (UIView*)v button:(SKSpriteNode*)node scene:(SKScene*)s {

    if([node.name isEqualToString:@"menuBuildingUpgradeButton"]){
        [statsMenuButtons buttonAnimation:node action:[SKAction runBlock:^{
            [buildingUpgradeUI createBuildingUI:s];
            
        }]];
    }
    if([node.name isEqualToString:@"buidlingBack"]){
        [buttonAnimation changeState:node changeName:@"backButtonPressure" originalName:@"backButton"];
        SKSpriteNode *menu = (SKSpriteNode*)[node parent];
        SKAction *slideOut = [SKAction moveByX:0 y:-s.frame.size.height duration:0.3];
        [menu runAction:slideOut completion:^{
            [menu removeFromParent];
        }];
    }
}

@end
