//
//  upgradeMenu.m
//  Candy
//
//  Created by Callum Beckwith on 15/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "upgradeMenu.h"
#import "menuBacking.h"
#import "sweetsButton.h"
#import "menuBackButton.h"

SKSpriteNode *btn_regular = nil;
SKSpriteNode *btn_special = nil;
SKSpriteNode *menu = nil;
SKSpriteNode *upgradeBack = nil;

@implementation upgradeMenu
bool createdUpgrades = false;

+(void)menuHandler: (SKScene*)s inScene:(bool)in{
    
    if(!createdUpgrades){
        upgradeBack = [SKSpriteNode spriteNodeWithImageNamed:@"spr_upgrade_regular"];
        upgradeBack.xScale = 0.43;
        upgradeBack.yScale = 0.43;
        upgradeBack.anchorPoint = CGPointMake(0.5, 0.52);
        
        upgradeBack.position = CGPointMake(0, -s.frame.size.height);
        upgradeBack.name = @"menuUpgrades";
        [s addChild:upgradeBack];
        [self createButtons:s];
    }
    
    //SKSpriteNode *upgradeBack = (SKSpriteNode*)[s childNodeWithName:@"menuUpgrades"];
    
    if(in){
        [self createMenu:upgradeBack scene:s];
    }else if(!in) {
        [self removeMenu:s];
    }
    
}
+(void)createButtons:(SKScene*)s{
    btn_regular = [SKSpriteNode spriteNodeWithImageNamed:@"spr_regular_button"];
    btn_special = [SKSpriteNode spriteNodeWithImageNamed:@"spr_special_button"];
    
    btn_regular.position = CGPointMake(-180, -650);
    btn_special.position =CGPointMake(180, -650);
    
    btn_regular.xScale = 0.43;
    btn_regular.yScale = 0.43;
    btn_special.xScale = 0.43;
    btn_special.yScale = 0.43;
    
    btn_regular.name = @"btn_regular";
    btn_special.name = @"btn_special";
    btn_regular.hidden = true;
    btn_special.hidden = true;
    
    [s addChild:btn_regular];
    [s addChild:btn_special];
}
+(void)SwitchingMenu:(SKScene*)s node:(SKNode*)n{
    if([n.name isEqualToString:@"btn_special"]){
        upgradeBack.texture = [SKTexture textureWithImageNamed:@"spr_upgrade_special"];
        btn_regular.hidden = false;
        btn_special.hidden = true;
    }
    else if([n.name isEqualToString:@"btn_regular"]){
        upgradeBack.texture = [SKTexture textureWithImageNamed:@"spr_upgrade_regular"];
        btn_regular.hidden = true;
        btn_special.hidden = false;
    }
}
+(void)createMenu: (SKSpriteNode*)upgradeBack scene:(SKScene*)s; {
    createdUpgrades = true;
    
    SKAction *slideUp = [SKAction moveToY:(upgradeBack.position.y+s.frame.size.height) duration:0.3];
    SKAction *slideUpBtn = [SKAction moveToY:(414) duration:0.3];
    [btn_regular runAction:slideUpBtn];
    [btn_special runAction:slideUpBtn];
    [upgradeBack runAction:slideUp completion:^{
        [menuBackButton createButton:s];
        btn_special.hidden = false;
    }];
}

+(void)removeMenu: (SKScene*)s; {
    
    btn_special.hidden = true;
    btn_regular.hidden = true;
    SKAction *slideDown = [SKAction moveToY:(-s.frame.size.height) duration:0.3];
    [btn_regular runAction:slideDown];
    [btn_special runAction:slideDown];
    [upgradeBack runAction:slideDown completion:^{
        [menuBackButton removeButton:s];
        upgradeBack.texture = [SKTexture textureWithImageNamed:@"spr_upgrade_regular"];
    }];
}
@end
