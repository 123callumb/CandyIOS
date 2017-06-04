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
#import "tutorialMessages.h"
#import "spinData.h"
#import "mainTransition.h"

@implementation spinScene

bool spinTaken = false;

-(void)didMoveToView:(SKView *)view {
    
    self.anchorPoint = CGPointMake(0.5, 0.5);
    [spinBox addRandomPRizePane:self];
    [spinWheel addWheel:self];
    SKSpriteNode *header = [SKSpriteNode spriteNodeWithImageNamed:@"spinHeader"];
    header.size = CGSizeMake(self.frame.size.width, self.frame.size.height/6);
    header.position = CGPointMake(0, self.frame.size.height/2 - header.frame.size.height/2);
    [self addChild:header];
    
    [tutorialMessages firstTimeDailySpin:self.view];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    [sparks createSpriteSplosion:self nodeAmount:4 pos:loc];
    
    if(!spinTaken){
        [spinWheel onBoxInteraction:self box:(SKSpriteNode*)obj];
        
    }else {
        if([self childNodeWithName:@"rewardPane"]){
            [mainTransition switchScene:self sceneTwo:@"main" Transition:[SKTransition crossFadeWithDuration:0.3]];
        }
    }
}
+(void)spinTaken {
        spinTaken = true;
}
@end
