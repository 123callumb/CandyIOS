//
//  packetMenu.m
//  Candy
//
//  Created by Callum Beckwith on 09/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "packetMenu.h"
#import "menuBacking.h"
#import "menuBackButton.h"
#import "packetButton.h"
#import "packetUIButtons.h"

@implementation packetMenu
+(void)menuHandler: (SKScene*)s inScene:(bool)in{
    
    SKSpriteNode *packets = (SKSpriteNode*)[menuBacking createPacketsBacking];
    packets.position = CGPointMake(0, s.frame.size.height/18);
    packets.name = @"menuPacket";
    [packetUIButtons addButtons:packets];
    
    if(in){
        [self createMenu:packets scene:s];
    }else if(!in) {
        [self removeMenu:s node:packets];
    }
    
}
+(void)createMenu: (SKSpriteNode*)main scene:(SKScene*)s; {
    
    [s addChild:main];
    SKAction *slideUp = [SKAction scaleTo:0.43 duration:0.15];
    [main runAction:slideUp completion:^{
        [menuBackButton createButton:s];
    }];
}
+(void)removeMenu: (SKScene*)s node:(SKSpriteNode*)l; {

    SKSpriteNode *m = (SKSpriteNode*)[s childNodeWithName:@"menuPacket"];

    SKAction *scaleDown = [SKAction scaleTo:0.0 duration:0.15];
    [m runAction:scaleDown completion:^{
        [menuBackButton removeButton:s];
        [m removeFromParent];
        [packetButton reCreate:s];
    }];
}


@end
