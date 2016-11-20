//
//  sweetCustomMenu.m
//  Candy
//
//  Created by Callum Beckwith on 20/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetCustomMenu.h"
#import "slot1Data.h"
#import "registerBoxes.h"
#import "sweetPicker.h"

@implementation sweetCustomMenu
bool createdBox1 = false;
+(void)menuActions: (SKScene *)s inScene:(bool)in {
    
    if(!createdBox1){
        SKSpriteNode *topHalf = [SKSpriteNode spriteNodeWithImageNamed:@"invSlot"];
        SKSpriteNode *bottomHalf = [SKSpriteNode spriteNodeWithImageNamed:@"boxScreenBottom"];
        SKSpriteNode *boxTitle = [SKSpriteNode spriteNodeWithImageNamed:@"titleBox"];
        SKLabelNode *boxTitleText = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
        
        topHalf.xScale = 0.45;
        topHalf.yScale = 0.45;
        bottomHalf.xScale = 0.45;
        bottomHalf.yScale = 0.45;
        
        [topHalf addChild:boxTitle];
        [boxTitle addChild:boxTitleText];
        
        topHalf.position = CGPointMake(0, s.frame.size.height*2);
        bottomHalf.position = CGPointMake(0, -s.frame.size.height*2);
        boxTitle.position = CGPointMake(0, topHalf.frame.size.height/1.2);
    
        boxTitleText.text = @"SET SLOT";
        boxTitleText.fontSize = 170;
        boxTitleText.fontColor = [UIColor blackColor];
        boxTitleText.position = CGPointMake(0, -boxTitle.frame.size.height/10);
        
        topHalf.name = @"invBoxTop";
        bottomHalf.name = @"invBoxBottom";
        
        topHalf.zPosition = 14;
        bottomHalf.zPosition = 15;
        
        bottomHalf.anchorPoint = CGPointMake(0.5, 0.5);
        
        [sweetPicker addSweetPicker:topHalf];
        [s addChild:topHalf];
        [s addChild:bottomHalf];
    }
    
    SKSpriteNode *boxMenu = (SKSpriteNode*)[s childNodeWithName:@"invBoxTop"];
    SKSpriteNode *boxMenuBottom = (SKSpriteNode*)[s childNodeWithName:@"invBoxBottom"];
    
    if(in){
        [self createMenu:s node:boxMenu node2:boxMenuBottom];
    }else if(!in) {
        [self removeMenu:s];
    }
}

+(void)createMenu: (SKScene *)s node:(SKSpriteNode *)main node2:(SKSpriteNode *)main2 {
    
    createdBox1 = true;
    
    SKAction *slideUp = [SKAction moveToY:(0) duration:0.3];
    SKAction *slideDown = [SKAction moveToY:-s.frame.size.height/2.3 duration:0.3];
    [main runAction:slideUp];
    [main2 runAction:slideDown];
}

+(void)removeMenu: (SKScene *)s {
    
    SKSpriteNode *main = (SKSpriteNode*)[s childNodeWithName:@"boxMenu1"];
    
    SKAction *slideDown = [SKAction moveToY:(-s.frame.size.height) duration:0.3];
    [main runAction:slideDown completion:^{
    }];
}
@end
