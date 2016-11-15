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

@implementation upgradeMenu
bool createdUpgrades = false;

+(void)menuHandler: (SKScene*)s inScene:(bool)in{
    
    if(!createdUpgrades){
        SKSpriteNode *main = (SKSpriteNode*)[menuBacking createUpgradesBacking];
        main.position = CGPointMake(0, -s.frame.size.height);
        main.name = @"menuUpgrades";
        [s addChild:main];
    }
    
    SKSpriteNode *main = (SKSpriteNode*)[s childNodeWithName:@"menuUpgrades"];
    
    if(in){
        [self createMenu:main scene:s];
    }else if(!in) {
        [self removeMenu:s];
    }
    
}
+(void)createMenu: (SKSpriteNode*)main scene:(SKScene*)s; {
    
    createdUpgrades = true;
    
    SKAction *slideUp = [SKAction moveToY:(main.position.y+s.frame.size.height) duration:0.5];
    [main runAction:slideUp completion:^{
        [menuBackButton createButton:s];
    }];
}
+(void)removeMenu: (SKScene*)s; {
    
    SKSpriteNode *main = (SKSpriteNode*)[s childNodeWithName:@"menuUpgrades"];
    
    SKAction *slideDown = [SKAction moveToY:(-s.frame.size.height) duration:0.5];
    [main runAction:slideDown completion:^{
        [menuBackButton removeButton:s];
    }];
}
@end
