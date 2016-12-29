//
//  inventoryButton.m
//  Candy
//
//  Created by Callum Beckwith on 06/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "inventoryButton.h"
#import "buttonAnimation.h"
#import "inventoryMenu.h"
#import "menuHandler.h"
#import "slot.h"
#import "quickSelectUI.h"

@implementation inventoryButton
bool isBusy = false;

+(void)addButton: (SKScene *)s {
    
    SKSpriteNode *buttonInventory = [SKSpriteNode spriteNodeWithImageNamed:@"pointlessButton"];
    buttonInventory.anchorPoint = CGPointMake(0.5, 0.5);
    buttonInventory.position = CGPointMake(0, -s.frame.size.height/2.25);
    buttonInventory.xScale = 0.45;
    buttonInventory.yScale = 0.45;
    buttonInventory.zPosition = 11;
    buttonInventory.name = @"buttonInventory";
    [s addChild:buttonInventory];
}
+(void)onTouch: (SKNode *)b cs:(SKScene *)s view:(UIView*)v{
    if([menuHandler getCurrentMenu] == 4){
    //Change Animation State:
    [buttonAnimation changeState:b changeName:@"pointlessButtonPressed" originalName:@"pointlessButton"];
    
    //When the button has been pressed
    if(isBusy){
        NSLog(@"button busy");
        }
    
    //Buttons Action Here:
    else if(!isBusy){
        [self buttonReset:s];
        [inventoryMenu menuActions:s inScene:true];
        [menuHandler menuRemover:s];
        [quickSelectUI addUI:v];
        //The Inventory has the id of 0
        [menuHandler setCurrentMenu:0];
    }
    }
}

+(void)buttonReset: (SKScene*)s {
    isBusy = true;
    SKAction *wait = [SKAction waitForDuration:1];
    [s runAction:wait completion:^{
        isBusy = false;
    }];
}

@end
