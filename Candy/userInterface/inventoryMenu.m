//
//  inventoryMenu.m
//  Candy
//
//  Created by Callum Beckwith on 07/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "inventoryMenu.h"
#import "menuBacking.h"
#import "inventoryButton.h"

@implementation inventoryMenu

bool created = false;

+(void)menuActions: (SKScene *)s inScene:(bool)in {
    
    if(!created){
    SKSpriteNode *main = (SKSpriteNode *)[menuBacking createBacking];
    main.position = CGPointMake(0, -s.frame.size.height);
    main.name = @"menuInventory";
    [s addChild:main];
    }
    
    SKSpriteNode *main = (SKSpriteNode*)[s childNodeWithName:@"menuInventory"];
    
    if(in){
        [self createMenu:s node:main];
    }else if(!in) {
        [self removeMenu:s node:main];
    }
}

+(void)createMenu: (SKScene *)s node:(SKSpriteNode *)main {
    
    created = true;
    [inventoryButton invActive];
    [inventoryButton isBusy];
    
    SKAction *slideUp = [SKAction moveToY:(main.position.y+s.frame.size.height) duration:0.5];
    [main runAction:slideUp completion:^{
            [inventoryButton isntBusy];
    }];
}

+(void)removeMenu: (SKScene *)s node:(SKSpriteNode *)m {
    
    SKSpriteNode *main = (SKSpriteNode*)[s childNodeWithName:@"menuInventory"];
    
    [inventoryButton isBusy];
    
    SKAction *slideDown = [SKAction moveToY:(-s.frame.size.height) duration:0.5];
    [main runAction:slideDown completion:^{
            [inventoryButton isntBusy];
            [inventoryButton invDeactive];
    }];
}

@end
