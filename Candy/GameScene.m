//
//  GameScene.m
//  Candy
//
//  Created by Callum Beckwith on 04/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "GameScene.h"
#import "backgroundManager.h"
#import "mainTransition.h"
#import "main.h"

@implementation GameScene {
    
    SKScene *main;
}

//We will use this as like a splash screen and then initialise all the other scenes from it.

- (void)didMoveToView:(SKView *)view {
    
    //Set Background, Foreground etc..
    [backgroundManager splashScene:self];
    NSLog(@"test");
    
    //Add Scene Extras
    //This can be moved to a custom delay method, but is it worth it?
    SKAction *splashTime = [SKAction waitForDuration:2];
    [self runAction:splashTime completion:^{
        [mainTransition switchScene:self sceneTwo:main Transition:[SKTransition crossFadeWithDuration:1] sceneID:0];
    }];
    
    }

-(void)update:(CFTimeInterval)currentTime {
    
   }

@end
