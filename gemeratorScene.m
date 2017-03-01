//
//  gemeratorScene.m
//  Candy
//
//  Created by Callum Beckwith on 01/03/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "gemeratorScene.h"
#import "tutorialMessages.h"
#import "objectivesSilver.h"
#import "mainTransition.h"
#import "gemInteractionUI.h"

@implementation gemeratorScene
-(void)didMoveToView:(SKView *)view {
    
    [self setAnchorPoint:CGPointMake(0.5, 0.5)];
    
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"gem_backdrop"];
    background.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    [self addChild:background];
    
    SKSpriteNode *titleItems = [SKSpriteNode spriteNodeWithImageNamed:@"gem_title"];
    titleItems.xScale = 0.48;
    titleItems.yScale = 0.48;
    titleItems.position = CGPointMake(0, self.frame.size.height/3);
    [self addChild:titleItems];
    
    SKSpriteNode *back = [SKSpriteNode spriteNodeWithImageNamed:@"crossButton"];
    back.yScale = 0.35;
    back.xScale = 0.35;
    back.name = @"backButton";
    back.position = CGPointMake(-self.frame.size.width/2 + back.frame.size.width/2, self.frame.size.height/2 - back.frame.size.height/2);
    [self addChild:back];
    
    [gemInteractionUI addInteractionUI:self];
    
    [tutorialMessages firstTimeGemeratorButton:self.view];
    [objectivesSilver object1:self.view];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint loc = [touch locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    if([obj.name isEqualToString:@"backButton"]){
        SKAction *grow = [SKAction scaleTo:0.3 duration:0.3];
        SKAction *shrink = [SKAction scaleTo:0.35 duration:0.3];
        [obj runAction:grow completion:^{
            [obj runAction:shrink];
        }];
    }else {
        [gemInteractionUI onInteraction:(SKSpriteNode*)obj pos:loc];
    }
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint loc = [touch locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    if([obj.name isEqualToString:@"backButton"]){
        SKAction *grow = [SKAction scaleTo:0.3 duration:0.3];
        [obj runAction:grow completion:^{
            [mainTransition switchScene:self sceneTwo:@"main" Transition:[SKTransition crossFadeWithDuration:0.3]];
        }];
    }
    
}
@end
