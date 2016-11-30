//
//  background.m
//  Character_Maker
//
//  Created by Killian Comerford on 25/11/2016.
//  Copyright © 2016 Killian Comerford. All rights reserved.
//

#import "background.h"
SKSpriteNode *bg1 = nil;
SKSpriteNode *bg2 = nil;
SKSpriteNode *back = nil;
int scrollSpeed = 5;

@implementation background
+(void)spawnTextures:(SKScene*)s{
    bg1 = [SKSpriteNode spriteNodeWithImageNamed:@"back"];
    bg2 = [SKSpriteNode spriteNodeWithImageNamed:@"back"];
    back = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
    
    bg1.anchorPoint = CGPointMake(0, 0);
    bg2.anchorPoint = CGPointMake(0, 0);
    back.anchorPoint = CGPointMake(0, 0);
    back.position = CGPointMake(0, 0);
    bg1.position = CGPointMake(0, s.frame.size.height);
    bg2.position = CGPointMake(0, bg1.frame.size.height + (s.frame.size.height));
    
    [s addChild:back];
    [s addChild:bg1];
    [s addChild:bg2];
}
+(void)updating{
    bg1.position = CGPointMake(0, bg1.position.y - scrollSpeed);
    bg2.position = CGPointMake(0, bg2.position.y - scrollSpeed);
    
    if(bg1.position.y < bg2.position.y){
        if(bg1.position.y <= -2500){
            bg1.position = CGPointMake(0, bg1.frame.size.height-scrollSpeed);
        }
    }
    else if(bg1.position.y > bg2.position.y){
        if(bg2.position.y <= -2500){
            bg2.position = CGPointMake(0, bg2.frame.size.height-scrollSpeed);
        }
    }
}
@end
