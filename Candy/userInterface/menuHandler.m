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

@implementation menuHandler
//The slide up thingy!
int currentMenu = 0;

+(int)getCurrentMenu {
    return currentMenu;
}

+(void)menuRemover:(SKScene*)s {
    
    SKSpriteNode *coinButton = (SKSpriteNode*)[s childNodeWithName:@"buttonMoney"];
    SKSpriteNode *invButton = (SKSpriteNode*)[s childNodeWithName:@"buttonInventory"];
    SKSpriteNode *storeButton = (SKSpriteNode*)[s childNodeWithName:@"buttonSweets"];
    
    SKAction *slideToDaRight = [SKAction moveByX:s.frame.size.width y:0 duration:0.2];
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
+(void)closeMenu:(SKScene*)s {
    if(currentMenu == 0){
        [inventoryMenu menuActions:s inScene:false];
        [self menuBringBacker:s];
        currentMenu = 3;
    }else if(currentMenu == 1){
        
        [statsMenu menuHandler:s inScene:false];
        [self menuBringBacker:s];
        currentMenu = 3;
        
    }else if(currentMenu == 2){
        
        currentMenu = 3;
    }
}
+(void)setCurrentMenu: (int)num {
    currentMenu = num;
}

@end
