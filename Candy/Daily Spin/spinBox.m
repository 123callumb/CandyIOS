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
#import "spinData.h"
#import "spinWheel.h"
#import "spinStreak.h"
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
        prize.position = CGPointMake(0, 0);
        prize.xScale = 2;
        prize.yScale = 2;
        [box addChild:prize];
        
        
        
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
    
    SKSpriteNode *box = (SKSpriteNode*)[s childNodeWithName:@"box"];
    SKSpriteNode *prize = (SKSpriteNode*)[box childNodeWithName:@"boxPrize"];
    SKAction *movePrize = [SKAction moveByX:(-box.frame.size.width/2) y:0 duration:0.8];
    
    [prize runAction:movePrize];
    
    if([finalOutcome isEqualToString:@"coin"]){
        [money addBalance:1000];
        [spinWheel addPrizeValue:s text:@"x1000!" pos:CGPointMake(box.frame.size.width/6, box.position.y - box.frame.size.height/20) textSize:150];
    }
    if([finalOutcome isEqualToString:@"gem"]){
        [gems addGems:1];
        [spinWheel addPrizeValue:s text:@"x1!" pos:CGPointMake(box.frame.size.width/6, box.position.y - box.frame.size.height/20) textSize:150];

    }
    if([finalOutcome isEqualToString:@"miniGems"]){
        [gems addMiniGems:10];
        [spinWheel addPrizeValue:s text:@"x10!" pos:CGPointMake(box.frame.size.width/6, box.position.y - box.frame.size.height/20) textSize:150];

    }
    [spinWheel addPrizeValue:s text:[NSString stringWithFormat:@"%d Spin Streak:", [spinData getStreakValue]]
                         pos:CGPointMake(box.frame.size.width/6, box.position.y - box.frame.size.height/6) textSize:50];
    [spinWheel addPrizeValue:s text:[spinStreak determineSpinStreakPrize]
                         pos:CGPointMake(box.frame.size.width/6, box.position.y - box.frame.size.height/3.5) textSize:50];

    [s runAction:[SKAction waitForDuration:4] completion:^{
        [mainTransition switchScene:s sceneTwo:@"main" Transition:[SKTransition fadeWithColor:[SKColor blackColor] duration:2.5]];
    }];
    
    [spinData setCurrentDate];
}
@end
