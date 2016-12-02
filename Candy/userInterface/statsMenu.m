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
#import "statsMenuButtons.h"

@implementation statsMenu

bool createdStats = false;

+(void)menuHandler: (SKScene*)s inScene:(bool)in{
    
    SKSpriteNode *main = (SKSpriteNode*)[menuBacking createStatsBacking];
    main.position = CGPointMake(0, -s.frame.size.height);
    main.name = @"menuStats";
    [statsMenuButtons addStatsButton:main];
    [s addChild:main];
    
    SKSpriteNode *main_ = (SKSpriteNode*)[s childNodeWithName:@"menuStats"];

    
    if(in){
        [self createMenu:main_ scene:s];
    }else if(!in) {
        [self removeMenu:s node:main_];
    }
    
}
+(void)createMenu: (SKSpriteNode*)main scene:(SKScene*)s; {
    
    SKAction *slideUp = [SKAction moveToY:(main.position.y+s.frame.size.height) duration:0.3];
    [main runAction:slideUp completion:^{
            [menuBackButton createButton:s];
    }];
}
+(void)removeMenu: (SKScene*)s node:(SKSpriteNode*)m; {
    
    SKAction *slideDown = [SKAction moveToY:(-s.frame.size.height) duration:0.3];
    [m runAction:slideDown completion:^{
        [menuBackButton removeButton:s];
        [m removeFromParent];
    }];
}

@end
