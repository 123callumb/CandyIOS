//
//  gemInteractionUI.m
//  Candy
//
//  Created by Callum Beckwith on 01/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "gemInteractionUI.h"
#import "gems.h"
#import "gemPotData.h"
#import "sparks.h"

@implementation gemInteractionUI
+(void)addInteractionUI: (SKScene*)s {
    [self addGemPot:s];
    [self addGemLabelValues:s];
}
+(void)addGemPot: (SKScene*)s {
    SKSpriteNode *pot = [SKSpriteNode spriteNodeWithImageNamed:@"gem_pot"];
    pot.name = @"gemBag";
    pot.xScale = 0.5;
    pot.yScale = 0.5;
    pot.position = CGPointMake(0, -s.frame.size.height/2.6);
    pot.zPosition = 0;
    [s addChild:pot];
}
+(void)onInteraction: (SKSpriteNode*)s pos:(CGPoint)loc {
    if([gems getMiniGems] > 0){
            SKSpriteNode *ui = (SKSpriteNode*)[s parent];
            SKSpriteNode *gemPot = (SKSpriteNode*)[ui childNodeWithName:@"gemBag"];
            
            [self miniGemAnimation:ui bagNode:gemPot touchPos:loc];
    }
}
+(void)miniGemAnimation: (SKSpriteNode*)s bagNode:(SKSpriteNode*)bagNode touchPos:(CGPoint)pos {
    SKSpriteNode *miniGem = [SKSpriteNode spriteNodeWithImageNamed:@"miniGems"];
    miniGem.position = pos;
    miniGem.zPosition = 15;
    miniGem.xScale = 0.43;
    miniGem.yScale = 0.43;
    [s addChild:miniGem];
    
    CGPoint bagPos = bagNode.position;
    SKAction *moveMiniGem = [SKAction moveTo:CGPointMake(bagPos.x, bagPos.y+bagNode.frame.size.height/8) duration:0.3];
    
    [miniGem runAction:moveMiniGem completion:^{
        [gemPotData addGems:1 scene:s];
        [miniGem removeFromParent];
    }];
    
    
}
+(void)addGemLabelValues: (SKScene*)s {
    SKLabelNode *gemValue = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    SKLabelNode *miniGemValue = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    SKLabelNode *tapToTrade = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    
    gemValue.name = @"label_gemValue";
    miniGemValue.name = @"label_miniGemValue";
    
    tapToTrade.zRotation = -M_PI/8;
    
    tapToTrade.position = CGPointMake(s.frame.size.width/4, -s.frame.size.height/6);
    gemValue.position = CGPointMake(s.frame.size.width/6, 0);
    miniGemValue.position = CGPointMake(-s.frame.size.width/6, 0);
    
    tapToTrade.zPosition = 14;
    miniGemValue.zPosition = 14;
    gemValue.zPosition = 14;
    
    tapToTrade.fontSize = 60.0f;
    miniGemValue.fontSize = 100.0f;
    gemValue.fontSize = 100.0f;
    
    tapToTrade.fontColor = [SKColor colorWithDisplayP3Red:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    miniGemValue.fontColor = [SKColor colorWithDisplayP3Red:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    gemValue.fontColor = [SKColor colorWithDisplayP3Red:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    
    tapToTrade.text = @"TAP TO TRADE";
    gemValue.text = [gems getGemsAsString];
    miniGemValue.text = [gems getMiniGemsAsString];
    
    SKAction *shrink = [SKAction scaleBy:0.8 duration:0.4];
    SKAction *grow = [SKAction scaleBy:1.25 duration:0.4];
    SKAction *runBoth = [SKAction sequence:@[shrink, grow]];
    SKAction *repeat = [SKAction repeatActionForever:runBoth];
    
    [s addChild:tapToTrade];
    
    [tapToTrade runAction:repeat];
    
    [s addChild:gemValue];
    [s addChild:miniGemValue];
    
    
}
+(void)potAnimation: (SKSpriteNode*)s gemValue:(int)gemNo {
    
    SKSpriteNode *gem = [SKSpriteNode spriteNodeWithImageNamed:@"gem"];
    SKLabelNode *amount = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    SKAction *moveUp = [SKAction moveToY:0 duration:0.6];
    SKAction *fadeItem = [SKAction fadeOutWithDuration:0.6];
    SKAction *growItem = [SKAction scaleBy:2 duration:0.4];
    
    if(gemNo == 15){
        gem.position = CGPointMake(0, -s.frame.size.height/2.2);
        gem.zPosition = 16;
        gem.xScale = 1;
        gem.yScale = 1;
        [s addChild:gem];
        
        [gem runAction:moveUp];
        [gem runAction:growItem completion:^{
            [gem runAction:fadeItem completion:^{
                [gem removeFromParent];
                [gems addGems:1];
                [self refreshLabelNodes:s];
            }];
        }];

    }else {
        amount.position = CGPointMake(0, -s.frame.size.height/2.8);
        amount.fontSize = 100.0f;
        amount.fontColor = [SKColor whiteColor];
        amount.zPosition = 16;
        amount.text = [gemPotData getGemsAsString];
        
        [s addChild:amount];
        
        [sparks createSpriteSplosion:(SKScene*)s nodeAmount:4 pos:amount.frame.origin];
        
        [amount runAction:moveUp];
        [amount runAction:fadeItem completion:^{
            [amount removeFromParent];
        }];
    }
}
+(void)refreshLabelNodes: (SKSpriteNode*)s {
    SKLabelNode *gemV = (SKLabelNode*)[s childNodeWithName:@"label_gemValue"];
    SKLabelNode *miniV = (SKLabelNode*)[s childNodeWithName:@"label_miniGemValue"];
    
    gemV.text = [gems getGemsAsString];
    miniV.text = [gems getMiniGemsAsString];
}
@end
