//
//  mapScene.m
//  Candy
//
//  Created by Callum Beckwith on 01/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "mapScene.h"
#import "mapMain.h"
#import "mapGui.h"
#import "main.h"

@implementation mapScene
-(void)didMoveToView:(SKView *)view {
    //Set Background Foreground, mainly static!
    [mapMain createMap:self];
    self.anchorPoint = CGPointMake(0.5, 0.5);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    SKScene *mainScene = [[main alloc] initWithSize:self.size];
    
    [mapGui onTouchOfBack:self obj:(SKSpriteNode*)obj scene2:mainScene];
}

//These methods are new and pretty dank af!
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    [mapMain mapNavigation:loc node:(SKSpriteNode*)obj];    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}

-(void)update:(CFTimeInterval)currentTime {
    
}

@end
