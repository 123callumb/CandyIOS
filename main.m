//
//  main.m
//  Candy
//
//  Created by Callum Beckwith on 05/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "main.h"
#import "backgroundManager.h"
#import "mainUI.h"
#import "buttonHandler.h"
#import "taps.h"

@implementation main

-(void)didMoveToView:(SKView *)view {
    //Set Background Foreground, mainly static!
    [backgroundManager mainScene:self];
    [mainUI drawUI:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    [taps onPressed:self location:loc];
    [buttonHandler registerButtons:obj currentScene:self];
    
}

//These methods are new and pretty dank af!
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [taps onRelease:self];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}

-(void)update:(CFTimeInterval)currentTime {

}
@end
