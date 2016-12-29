//
//  menuHandler.m
//  Candy
//
//  Created by Callum Beckwith on 07/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "menuHandler.h"
#import "inventoryMenu.h"
#import "statsMenu.h"
#import "upgradeMenu.h"
#import "coinButton.h"
#import "packetMenu.h"
#import "sweetDrawUI.h"
#import "sweetInvSelectUI.h"

@implementation menuHandler
//The slide up thingy!
int currentMenu = 4;

+(int)getCurrentMenu {
    return currentMenu;
}

+(void)menuRemover:(SKScene*)s {
    
    SKSpriteNode *coinButton = (SKSpriteNode*)[s childNodeWithName:@"buttonMoney"];
    SKSpriteNode *invButton = (SKSpriteNode*)[s childNodeWithName:@"buttonInventory"];
    SKSpriteNode *storeButton = (SKSpriteNode*)[s childNodeWithName:@"buttonSweets"];
    
    SKAction *slideToDaRight = [SKAction moveByX:s.frame.size.width y:0 duration:0.1];
    SKAction *waitABitLovie = [SKAction waitForDuration:0.1];
   
    [s runAction:waitABitLovie completion:^{
        [invButton runAction:slideToDaRight];
        [coinButton runAction:slideToDaRight];
        [storeButton runAction:slideToDaRight];
    }];
    
    
}
+(void)menuBringBacker:(SKScene*)s {
    
    SKSpriteNode *coinButton = (SKSpriteNode*)[s childNodeWithName:@"buttonMoney"];
    SKSpriteNode *invButton = (SKSpriteNode*)[s childNodeWithName:@"buttonInventory"];
    SKSpriteNode *storeButton = (SKSpriteNode*)[s childNodeWithName:@"buttonSweets"];
    
    SKAction *slideToDaLeft = [SKAction moveByX:-s.frame.size.width y:0 duration:0.2];
    SKAction *waitABitLovie = [SKAction waitForDuration:0.1];
    
    [s runAction:waitABitLovie completion:^{
        [invButton runAction:slideToDaLeft];
        [coinButton runAction:slideToDaLeft];
        [storeButton runAction:slideToDaLeft];
    }];
}
+(void)closeMenu:(SKScene*)s view:(UIView*)v{
    if(currentMenu == 0){
        [inventoryMenu menuActions:s inScene:false];
        [self menuBringBacker:s];
        [sweetDrawUI removeMenu:v];
        [sweetInvSelectUI removeMenu:v];
        currentMenu = 4;
    }else if(currentMenu == 1){
        
        [statsMenu menuHandler:s inScene:false];
        [self menuBringBacker:s];
        currentMenu = 4;
        
    }else if(currentMenu == 2){
       
        [upgradeMenu menuHandler:s inScene:false];
        [self menuBringBacker:s];
        currentMenu = 4;
        
    }else if(currentMenu == 3){
        
        [packetMenu menuHandler:s inScene:false];
        [self menuBringBacker:s];
        currentMenu = 4;
        
    }
}
+(void)setCurrentMenu: (int)num {
    currentMenu = num;
}
+(void)refreshMenuSystem: (SKScene*)s; {
    [self setCurrentMenu:4];
    [inventoryMenu menuActions:s inScene:false];
    [statsMenu menuHandler:s inScene:false];
    [upgradeMenu menuHandler:s inScene:false];
    [coinButton buttonReset:s];
}
@end
