//
//  packetUIButtons.m
//  Candy
//
//  Created by Callum Beckwith on 09/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "packetUIButtons.h"
#import "mainTransition.h"
#import "sweetShopUI.h"

@implementation packetUIButtons
+(void)addButtons: (SKSpriteNode*)s {
    SKSpriteNode *myPackets = [SKSpriteNode spriteNodeWithImageNamed:@"myPacketsButton"];
    myPackets.position = CGPointMake(0, myPackets.frame.size.height/20);
    myPackets.name = @"packetsMyButton";
    
    SKSpriteNode *buyPackets = [SKSpriteNode spriteNodeWithImageNamed:@"buyPacketsButton"];
    buyPackets.position = CGPointMake(0, -(myPackets.frame.size.height/1.2));
    buyPackets.name = @"packetsBuyButton";
    
    [s addChild:buyPackets];
    [s addChild:myPackets];
}
+(void)onButtonPress:(SKSpriteNode*)s scene:(SKScene*)sk {
    if([s.name isEqualToString:@"packetsMyButton"]){
        SKAction *block = [SKAction runBlock:^{
            [mainTransition switchScene:sk sceneTwo:@"myPackets" Transition:[SKTransition fadeWithColor:[SKColor blackColor] duration:0.3]];
        }];
        [self buttonAnimation:s action:block];

       
    }
    if([s.name isEqualToString:@"packetsBuyButton"]){
        SKAction *block = [SKAction runBlock:^{
            [sweetShopUI showSweetShopUI:sk.view];
        }];
        [self buttonAnimation:s action:block];
    }
}

+(void)buttonAnimation: (SKSpriteNode*)s action:(SKAction*)r {
    SKAction *shrink = [SKAction scaleBy:0.8 duration:0.15];
    SKAction *grow = [SKAction scaleBy:1.25 duration:0.15];
    
    [s runAction:shrink completion:^{
        [s runAction:grow completion:^{
            [s runAction:r];
        }];
    }];
}
@end
