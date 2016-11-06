//
//  mainUI.m
//  Candy
//
//  Created by Callum Beckwith on 05/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "mainUI.h"
#import "inventoryButton.h"
#import "sweetsButton.h"
#import "coinButton.h"

@implementation mainUI


+(void)drawUI: (SKScene *)s{
    
    [inventoryButton addButton:s];
    [sweetsButton addButton:s];
    [coinButton addButton:s];
    
    SKSpriteNode *panelOne = [SKSpriteNode spriteNodeWithImageNamed:@"menuBarWhite"];
    panelOne.anchorPoint = CGPointMake(0.5, 0);
    panelOne.position = CGPointMake(0, -s.size.height/2);
    panelOne.yScale = 1.4;
    panelOne.xScale = 1;
    panelOne.zPosition = 10;
    
    [s addChild:panelOne];
    
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"woodTexture"];
    background.position = CGPointMake(0, -s.frame.size.height/3);
    background.anchorPoint = CGPointMake(0.5, 0.5);
    //[s addChild:background];
    
    SKSpriteNode *sweetMachine = [SKSpriteNode spriteNodeWithImageNamed:@"stupidMachine"];
    sweetMachine.anchorPoint = CGPointMake(0.5, 0.5);
    sweetMachine.position = CGPointMake(-s.frame.size.width/5, 0);
    //[s addChild:sweetMachine];
    
    SKSpriteNode *buttonDunno = [SKSpriteNode spriteNodeWithImageNamed:@"dunnoButton"];
    buttonDunno.anchorPoint = CGPointMake(0.5, 0.5);
    buttonDunno.position = CGPointMake(s.frame.size.width/2.5, s.frame.size.height/2.3);
    buttonDunno.xScale = 0.45;
    buttonDunno.yScale = 0.42;
    buttonDunno.zPosition = 11;
    [s addChild:buttonDunno];
    
    SKSpriteNode *coinBar = [SKSpriteNode spriteNodeWithImageNamed:@"coinBar"];
    coinBar.anchorPoint = CGPointMake(0.5, 0.5);
    coinBar.position = CGPointMake(-s.frame.size.width/4.4, s.frame.size.height/2.3);
    coinBar.xScale = 0.45;
    coinBar.yScale = 0.42;
    coinBar.zPosition = 11;
    [s addChild:coinBar];
    
    SKSpriteNode *comboBar = [SKSpriteNode spriteNodeWithImageNamed:@"redSmall"];
    comboBar.anchorPoint = CGPointMake(0.5, 0.5);
    comboBar.position = CGPointMake(-s.frame.size.width/2.8, s.frame.size.height/2.3);
    comboBar.xScale = 0.45;
    comboBar.yScale = 0.42;
    comboBar.zPosition = 11;
   // [s addChild:comboBar];
}
@end
