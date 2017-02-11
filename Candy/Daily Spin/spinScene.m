//
//  spinScene.m
//  Candy
//
//  Created by Callum Beckwith on 12/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "spinScene.h"
#import "spinWheel.h"
#import "sparks.h"
#import "spinBox.h"

@implementation spinScene

bool spinTaken = false;
int count = 0;

-(void)didMoveToView:(SKView *)view {
    
    self.anchorPoint = CGPointMake(0.5, 0.5);
    
    SKSpriteNode *backdrop = [SKSpriteNode spriteNodeWithImageNamed:@"backdropWheel"];
    backdrop.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    [self addChild:backdrop];
    [spinWheel addWheel:self];
    
    if(!spinTaken){
        SKAction *wait4Sec = [SKAction waitForDuration:0.2];
        SKAction *returnItem = [SKAction moveToY:(-self.frame.size.height/2 + self.frame.size.height/48) duration:0.2];
        SKAction *seq = [SKAction sequence:@[wait4Sec, returnItem]];
        SKAction *rep = [SKAction repeatActionForever:seq];
    
        SKSpriteNode *tapMeter = (SKSpriteNode*)[self childNodeWithName:@"meterScale"];
        [tapMeter runAction:rep];
    
        }
    
    }
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    
    if(!spinTaken){
        
        [sparks createSpriteSplosion:self nodeAmount:4 pos:loc];

        SKSpriteNode *tapMeter = (SKSpriteNode*)[self childNodeWithName:@"meterScale"];
        SKAction *grow = [SKAction moveToY:(tapMeter.position.y + self.frame.size.height/8) duration:0.2];
        [tapMeter runAction:grow];
        SKSpriteNode *wheel = (SKSpriteNode*)[self childNodeWithName:@"dailySpinWheel"];
        
        SKAction *rotateClockwise = [SKAction rotateByAngle:M_PI * 4 duration:0.8];
        SKAction *rotateSlowerClockwise = [SKAction rotateByAngle:M_PI*2.3 duration:1.5];
        
        [wheel runAction:rotateClockwise completion:^{
            [wheel runAction:rotateSlowerClockwise completion:^{
                    [self afterSpin:self];
            }];
            
        }];
    }

    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SKSpriteNode *tapMeter = (SKSpriteNode*)[self childNodeWithName:@"meterScale"];
    
        if(tapMeter.position.y > -self.frame.size.height/3.8){
            spinTaken = true;
    }
    
    if(spinTaken){
        [spinBox createPrizeBox:self];
    }
}
-(void)update:(NSTimeInterval)currentTime {
        [spinBox updateBox:self];
}
-(void)afterSpin: (SKScene*)s {
    
    if(spinTaken){
        [sparks createSpriteSplosion:self nodeAmount:10 pos:CGPointMake(0, -s.frame.size.height/4)];

        NSArray *spritesAtPoint = [s nodesAtPoint:CGPointMake(0, -s.frame.size.height/20)];
        for(int i = 0; i <= [spritesAtPoint count] - 1; i++){
            SKSpriteNode *node = [spritesAtPoint objectAtIndex:i];
            
                if([node.name isEqualToString:@"coin"]){
                    [spinBox setFinalOutcome:@"coin"];
                    NSLog(@"coin");
                }
                if([node.name isEqualToString:@"gem"]){
                    [spinBox setFinalOutcome:@"gem"];
                    NSLog(@"gem");
                }
                if([node.name isEqualToString:@"miniGem"]){
                    [spinBox setFinalOutcome:@"miniGems"];
                    NSLog(@"miniGem");
                }

        }
    }
}


@end
