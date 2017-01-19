//
//  spinBox.m
//  Candy
//
//  Created by Callum Beckwith on 14/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "spinBox.h"
#import "spinScene.h"
#import "mainTransition.h"
#import "money.h"
#import "gems.h"
@implementation spinBox

NSString *finalOutcome = @"gem";

+(void)createPrizeBox: (SKScene*)s {
    
    SKSpriteNode *box = (SKSpriteNode*)[s childNodeWithName:@"box"];
    
    if(box.name == nil){
    
        SKSpriteNode *box = [SKSpriteNode spriteNodeWithImageNamed:@"notBox"];
        box.position =  CGPointMake(0, s.frame.size.height/5);
        box.xScale = 0.1;
        box.yScale = 0.1;
        box.name = @"box";

        SKSpriteNode *prize = [SKSpriteNode spriteNodeWithImageNamed:[self getFinalOutcome]];
        prize.name = @"boxPrize";
        prize.zPosition = 10;
        prize.position = CGPointMake(-box.frame.size.width*3, 0);
        prize.xScale = 2;
        prize.yScale = 2;
        [box addChild:prize];
        
        SKLabelNode *multiplier = [SKLabelNode labelNodeWithText:@"x1 Day Bonus"];
        multiplier.fontName = @"Coder's-Crux";
        multiplier.fontColor = [SKColor blackColor];
        multiplier.fontSize = 150;
        multiplier.position = CGPointMake(box.frame.size.width*1.5, -multiplier.frame.size.height/4);
        [box addChild:multiplier];
        
        [s addChild:box];
        
        SKAction *grow = [SKAction scaleTo:0.5 duration:0.5];
        [box runAction:grow];
        
        SKAction *finalResult = [SKAction waitForDuration:3];
        [s runAction:finalResult completion:^{
            [self onResult:s];
        }];
        
    }

}
+(void)updateBox: (SKScene*)s {
    SKSpriteNode *box = (SKSpriteNode*)[s childNodeWithName:@"box"];
    SKSpriteNode *prize = (SKSpriteNode*)[box childNodeWithName:@"boxPrize"];
    if(box.name != nil){
        prize.texture = [SKTexture textureWithImageNamed:[self getFinalOutcome]];
    }
}
+(void)setFinalOutcome: (NSString*)str {
    finalOutcome = str;
}
+(NSString*)getFinalOutcome {
    return finalOutcome;
}
+(void)onResult: (SKScene*)s {
    if([finalOutcome isEqualToString:@"coin"]){
        [money addBalance:1000];
    }
    if([finalOutcome isEqualToString:@"gem"]){
        [gems addGems:1];
    }
    if([finalOutcome isEqualToString:@"miniGems"]){
        [gems addMiniGems:10];
    }
    [mainTransition switchScene:s sceneTwo:@"main" Transition:[SKTransition fadeWithColor:[SKColor blackColor] duration:2.5]];
    
}
@end
