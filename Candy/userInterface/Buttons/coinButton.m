//
//  coinButton.m
//  Candy
//
//  Created by Callum Beckwith on 06/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "coinButton.h"
#import "buttonAnimation.h"
#import "statsMenu.h"
#import "menuHandler.h"

@implementation coinButton
bool isCoinBusy = false;

+(void)addButton: (SKSpriteNode *)s {
    SKSpriteNode *buttonMoney = [SKSpriteNode spriteNodeWithImageNamed:@"moneyButton"];
    buttonMoney.anchorPoint = CGPointMake(0.5, 0.5);
    buttonMoney.position = CGPointMake(-buttonMoney.size.width/2.1, s.frame.size.height/4.2);
    buttonMoney.xScale = 0.45;
    buttonMoney.yScale = 0.33;
    buttonMoney.zPosition = 11;
    buttonMoney.name = @"buttonMoney";
    [s addChild:buttonMoney];
}
+(void)touched: (SKNode *)but cs:(SKScene *)s{
    if([menuHandler getCurrentMenu] == 4){
    [buttonAnimation changeState:but changeName:@"moneyButtonPressed" originalName:@"moneyButton"];
    //When the button has been pressed
    if(isCoinBusy){
        NSLog(@"button busy");
    }
    
    //Buttons Action Here:
    else if(!isCoinBusy){
        [self buttonReset:s];
        [statsMenu menuHandler:s inScene:true];
        [menuHandler menuRemover:s];
        
        //The Inventory has the id of 0
        [menuHandler setCurrentMenu:1];
    }
    }

}

+(void)buttonReset: (SKScene*)s {
    isCoinBusy = true;
    SKAction *wait = [SKAction waitForDuration:1];
    [s runAction:wait completion:^{
        isCoinBusy = false;
    }];
}

@end
