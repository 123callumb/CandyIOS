//
//  coinButton.m
//  Candy
//
//  Created by Callum Beckwith on 06/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "coinButton.h"
#import "buttonAnimation.h"

@implementation coinButton
+(void)addButton: (SKScene *)s {
    SKSpriteNode *buttonMoney = [SKSpriteNode spriteNodeWithImageNamed:@"moneyButton"];
    buttonMoney.anchorPoint = CGPointMake(0.5, 0.5);
    buttonMoney.position = CGPointMake(-buttonMoney.size.width/2.1, -s.frame.size.height/2.25);
    buttonMoney.xScale = 0.45;
    buttonMoney.yScale = 0.45;
    buttonMoney.zPosition = 11;
    buttonMoney.name = @"buttonMoney";
    [s addChild:buttonMoney];
    
}
+(void)touched: (SKNode *)but {
    [buttonAnimation changeState:but changeName:@"moneyButtonPressed" originalName:@"moneyButton"];
}
@end
