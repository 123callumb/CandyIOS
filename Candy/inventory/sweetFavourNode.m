//
//  sweetFavourNode.m
//  Candy
//
//  Created by Callum Beckwith on 06/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetFavourNode.h"
#import "doneButton.h"
#import "sweetTypeUI.h"
#import "sweetPicker.h"
#import "flavourPicker.h"

@implementation sweetFavourNode
+(void)menuActions: (SKScene *)s inScene:(bool)in {
    
    SKSpriteNode *topHalf = [SKSpriteNode spriteNodeWithImageNamed:@"inventoryBlankSpace"];
    SKSpriteNode *bottomHalf = [SKSpriteNode spriteNodeWithImageNamed:@"bottomInvHalf"];
    topHalf.xScale = 0;
    topHalf.yScale = 0;
    bottomHalf.xScale = 0.45;
    bottomHalf.yScale = 0.45;
    
    topHalf.position = CGPointMake(0, -s.frame.size.height/25);
    bottomHalf.position = CGPointMake(0, -s.frame.size.height*2);
    
    topHalf.name = @"invBoxTop";
    bottomHalf.name = @"invBoxBottom";
    
    topHalf.zPosition = 14;
    bottomHalf.zPosition = 15;
    
    bottomHalf.anchorPoint = CGPointMake(0.5, 0.5);
    
    [doneButton createButton:bottomHalf];
    
    [s addChild:topHalf];
    [s addChild:bottomHalf];
    
    SKSpriteNode *boxMenu = (SKSpriteNode*)[s childNodeWithName:@"invBoxTop"];
    SKSpriteNode *boxMenuBottom = (SKSpriteNode*)[s childNodeWithName:@"invBoxBottom"];
    
    if(in){
        [self createMenu:s node:boxMenu node2:boxMenuBottom];
    }else if(!in) {
        [self removeMenu:s node:boxMenu node2:boxMenuBottom];
    }
}
+(void)createMenu: (SKScene *)s node:(SKSpriteNode *)main node2:(SKSpriteNode *)main2 {
    
    SKAction *slideUp = [SKAction scaleTo:0.43 duration:0.1];
    SKAction *slideDown = [SKAction moveToY:-s.frame.size.height/2.3 duration:0.1];
    [main runAction:slideUp completion:^{
        [flavourPicker showUi:s.view];
    }];
    [main2 runAction:slideDown];
}

+(void)removeMenu: (SKScene *)s node:(SKSpriteNode *)main node2:(SKSpriteNode *)main2 {
    
    SKAction *slideUp = [SKAction moveToY:-s.frame.size.height duration:0.1];
    SKAction *slideDown = [SKAction scaleTo:0 duration:0.1];
    [flavourPicker hideUi:s.view];
    SKSpriteNode *menuInv = (SKSpriteNode*)[s childNodeWithName:@"menuInventory"];
    [sweetPicker refreshSweetType:menuInv];
    
    [main runAction:slideDown completion:^{
        [main removeFromParent];
    }];
    [main2 runAction:slideUp completion:^{
        [main2 removeFromParent];
    }];
}
@end
