//
//  statsMenu.m
//  Candy
//
//  Created by Callum Beckwith on 12/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "statsMenu.h"
#import "menuBacking.h"
#import "coinButton.h"
#import "menuBackButton.h"

@implementation statsMenu

bool createdStats = false;

+(void)menuHandler: (SKScene*)s inScene:(bool)in{
    
    if(!createdStats){
        SKSpriteNode *main = (SKSpriteNode*)[menuBacking createStatsBacking];
        main.position = CGPointMake(0, -s.frame.size.height);
        main.name = @"menuStats";
        [s addChild:main];
    }
    
    SKSpriteNode *main = (SKSpriteNode*)[s childNodeWithName:@"menuStats"];
    
    if(in){
        [self createMenu:main scene:s];
    }else if(!in) {
        [self removeMenu:s];
    }
    
}
+(void)createMenu: (SKSpriteNode*)main scene:(SKScene*)s; {
    
    createdStats = true;
    
    SKAction *slideUp = [SKAction moveToY:(main.position.y+s.frame.size.height) duration:0.5];
    [main runAction:slideUp completion:^{
            [menuBackButton createButton:s];
    }];
}
+(void)removeMenu: (SKScene*)s; {
    
    SKSpriteNode *main = (SKSpriteNode*)[s childNodeWithName:@"menuStats"];
    
    SKAction *slideDown = [SKAction moveToY:(-s.frame.size.height) duration:0.5];
    [main runAction:slideDown completion:^{
        [menuBackButton removeButton:s];
    }];
}

@end
