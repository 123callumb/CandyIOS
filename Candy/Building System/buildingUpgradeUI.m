//
//  buildingUpgradeUI.m
//  Candy
//
//  Created by Callum Beckwith on 08/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "buildingUpgradeUI.h"
#import "buildingType.h"
#import "quickSelectUI.h"
#import "money.h"
#import "mainTransition.h"


@implementation buildingUpgradeUI

+(void)createBuildingUI: (SKScene*)s {
    SKSpriteNode *mainBG = [SKSpriteNode spriteNodeWithImageNamed:@"buildingUpgradeMenuBG"];
    mainBG.xScale = 0.43;
    mainBG.yScale = 0.43;
    mainBG.zPosition = 15;
    mainBG.position = CGPointMake(0, -s.frame.size.height/26);
    mainBG.name = @"buildingUpgradeMenu";
    
    [self addBackButton:mainBG];
    [self addHouseType:mainBG];
    [self addPriceTag:mainBG];
    [self addNextHouseIcon:mainBG];
    [self addUpgradeButton:mainBG];
    
    [s addChild:mainBG];
    
}
+(void)addBackButton: (SKSpriteNode*)s {
    SKSpriteNode *backButton = [SKSpriteNode spriteNodeWithImageNamed:@"crossButton"];
    backButton.position = CGPointMake(-s.frame.size.width/1.3, s.frame.size.height/1.275);
    backButton.name = @"redCrossButton";
    [s addChild:backButton];
}
+(void)addHouseType: (SKSpriteNode*)s {
    SKLabelNode *houseName = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    houseName.text = [buildingType getNextBuildingName];
    houseName.position = CGPointMake(0, -s.frame.size.height/4.4);
    houseName.fontSize = 160.0f;
    houseName.fontColor = [SKColor blackColor];
    [s addChild:houseName];
}
+(void)addNextHouseIcon: (SKSpriteNode*)s {
    SKSpriteNode *building = [SKSpriteNode spriteNodeWithImageNamed:[buildingType getNextBuilding]];
    building.position = CGPointMake(0, s.frame.size.height/5);
    [s addChild:building];
}
+(void)addPriceTag: (SKSpriteNode*)s {
    SKLabelNode *price = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    price.text = [NSString stringWithFormat:@"%d", [buildingType getNextBuildingPrice]];
    price.position = CGPointMake(0, -s.frame.size.height/1.925);
    price.fontSize = 200.0f;
    price.fontColor = [SKColor blackColor];
    [s addChild:price];
}
+(void)addUpgradeButton: (SKSpriteNode*)s {
    SKSpriteNode *upgButton = [SKSpriteNode spriteNodeWithImageNamed:@"buildingUpgradeButton"];
    upgButton.position = CGPointMake(0, -s.frame.size.height/1.3);
    upgButton.name = @"buildingUpgradeButton";
    if([buildingType getNextBuildingPrice] != 0){
        [s addChild:upgButton];
    }
}
+(void)onBackTouch: (UIView*)v button:(SKSpriteNode*)node scene:(SKScene*)s {
    if([node.name isEqualToString:@"redCrossButton"]){
        [self removeMenu:s];
    }
}
+(void)removeMenu: (SKScene*)s {
    SKSpriteNode *menu = (SKSpriteNode*)[s childNodeWithName:@"buildingUpgradeMenu"];
    if(menu.name != nil){
        [menu removeFromParent];
    }
}
+(void)onUpgradeTouch: (UIView*)v button:(SKSpriteNode*)node scene:(SKScene*)s {
    if([money getBalance] >= [buildingType getNextBuildingPrice]){
        if([node.name isEqualToString:@"buildingUpgradeButton"]){
            [money addBalance:-([buildingType getNextBuildingPrice])];
            [buildingType setCurrentBuildingID:([buildingType getCurrentBuildingID] + 1)];
            [mainTransition switchScene:s sceneTwo:@"main" Transition:[SKTransition fadeWithDuration:0.3]];
        }
    }
}
@end
