//
//  freeItemsScene.m
//  Candy
//
//  Created by Callum Beckwith on 26/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "freeItemsScene.h"
#import "mainTransition.h"
#import "statsMenuButtons.h"

@implementation freeItemsScene
-(void)didMoveToView:(SKView *)view {
    [self setAnchorPoint:CGPointMake(0.5, 0.5)];
    [self addAllSceneItems:self];
}
-(void)addAllSceneItems: (SKScene*)s {
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"fsBackground"];
    background.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    
    SKSpriteNode *header = [SKSpriteNode spriteNodeWithImageNamed:@"fsHeader"];
    header.size = CGSizeMake(self.frame.size.width, self.frame.size.height/4.5);
    header.position = CGPointMake(0, self.frame.size.height/2 - header.frame.size.height/2);
    
    SKSpriteNode *bottomBar = [SKSpriteNode spriteNodeWithImageNamed:@"bottomInvHalf"];
    bottomBar.size = CGSizeMake(self.frame.size.width, self.frame.size.height/6.5);
    bottomBar.position = CGPointMake(0, -self.frame.size.height/2 + bottomBar.frame.size.height/2);
    bottomBar.name = @"bottomBar";
    
    SKSpriteNode *note = [SKSpriteNode spriteNodeWithImageNamed:@"fsNote"];
    note.size = CGSizeMake(self.frame.size.width, self.frame.size.height/7);
    note.position = CGPointMake(0, self.frame.size.height/4.7);
    
    SKSpriteNode *gemButton = [SKSpriteNode spriteNodeWithImageNamed:@"fsGem"];
    gemButton.size = CGSizeMake(self.frame.size.width/1.2, self.frame.size.height/6);
    gemButton.position = CGPointMake(0, self.frame.size.height/16);
    gemButton.name = @"gemButton";

    SKSpriteNode *miniGemButton = [SKSpriteNode spriteNodeWithImageNamed:@"fsMiniGems"];
    miniGemButton.size = CGSizeMake(self.frame.size.width/1.2, self.frame.size.height/6);
    miniGemButton.position = CGPointMake(0, -self.frame.size.height/3.9);
    miniGemButton.name = @"miniGemButton";
    
    SKSpriteNode *coinsButton = [SKSpriteNode spriteNodeWithImageNamed:@"fsCoins"];
    coinsButton.size = CGSizeMake(self.frame.size.width/1.2, self.frame.size.height/6);
    coinsButton.position = CGPointMake(0, -self.frame.size.height/10.3);
    coinsButton.name = @"coinsButton";
    
    SKSpriteNode *doneButton = [SKSpriteNode spriteNodeWithImageNamed:@"doneButton"];
    doneButton.xScale = 0.5;
    doneButton.yScale = 0.5;
    doneButton.position = CGPointMake(0, bottomBar.frame.size.height/12);
    doneButton.name = @"doneButton";
    
    [s addChild:background];
    [s addChild:header];
    [s addChild:bottomBar];
    [bottomBar addChild:doneButton];
    [s addChild:gemButton];
    [s addChild:miniGemButton];
    [s addChild:coinsButton];
    [s addChild:note];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    SKSpriteNode *node = (SKSpriteNode*)obj;
    
    if([node.name isEqualToString:@"doneButton"]){
        node.texture = [SKTexture textureWithImageNamed:@"donePressured"];
        SKAction *wait = [SKAction waitForDuration:0.01];
        [self runAction:wait completion:^{
            [mainTransition switchScene:self sceneTwo:@"main" Transition:[SKTransition fadeWithColor:[SKColor blackColor] duration:0.2]];
        }];
    }
    if ([node.name isEqualToString:@"gemButton"]) {
        [statsMenuButtons buttonAnimation:node action:[SKAction runBlock:^{}]];
    }
    if ([node.name isEqualToString:@"miniGemButton"]) {
        [statsMenuButtons buttonAnimation:node action:[SKAction runBlock:^{}]];
    }
    if ([node.name isEqualToString:@"coinsButton"]) {
        [statsMenuButtons buttonAnimation:node action:[SKAction runBlock:^{}]];
    }
}
@end
