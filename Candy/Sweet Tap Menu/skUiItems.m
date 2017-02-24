//
//  skUiItems.m
//  Candy
//
//  Created by Callum Beckwith on 27/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "skUiItems.h"
#import "buildingType.h"
#import "buildingUpgradeUI.h"
#import "quickSelectUI.h"
#import "statsMenuButtons.h"

@implementation skUiItems
+(void)addSkUI: (SKSpriteNode*)s {
    [self addBuildingIcon:s];
    [self addUpgradeBuildingButton:s];
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
    placeTitle.fontColor = [SKColor colorWithDisplayP3Red:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    placeTitle.position = CGPointMake(-buildingUpgButton.frame.size.width/16, -buildingUpgButton.frame.size.height/10);
    placeTitle.name = @"menuBuildingUpgradeButton";
    [buildingUpgButton addChild:placeTitle];
    [s addChild:buildingUpgButton];
}
+(void)onUpgTouch: (UIView*)v button:(SKSpriteNode*)node scene:(SKScene*)s {
    if([node.name isEqualToString:@"menuBuildingUpgradeButton"]){
        [statsMenuButtons buttonAnimation:node action:[SKAction runBlock:^{
            [quickSelectUI removeUI:v];
            [buildingUpgradeUI createBuildingUI:s];

        }]];

    }
}
@end
