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

+(void)menuActions: (SKScene *)s inScene:(bool)in {
    
    SKSpriteNode *main = (SKSpriteNode *)[menuBacking createBacking];
    main.position = CGPointMake(0, -s.frame.size.height);
    main.name = @"menuInventory";
    [s addChild:main];
    
    if(in){
        [self createMenu:s node:main];
    }else {
        [self removeMenu:s node:main];
    }
}

+(void)createMenu: (SKScene *)s node:(SKSpriteNode *)main {

    [inventoryButton invActive];
    
    SKAction *slideUp = [SKAction moveToY:(main.position.y+s.frame.size.height) duration:0.5];
    [main runAction:slideUp];
}
+(void)removeMenu: (SKScene *)s node:(SKSpriteNode *)main {
    
    main = (SKSpriteNode*)[s childNodeWithName:@"menuInventory"];
    
    SKAction *slideDown = [SKAction moveToY:(-s.frame.size.height) duration:0.5];
    [main runAction:slideDown completion:^{
        [inventoryButton invDeactive];
    }];
 }
@end
