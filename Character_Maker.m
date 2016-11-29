//
//  Charcter_Maker.m
//  Candy
//
//  Created by Killian Comerford on 29/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "Character_Maker.h"
#import "selection_bar.h"
#import "character_clothes.h"
#import "background.h"
#import "skinColour.h"
#import "Save.h"

int imageState;

@implementation Character_Maker
- (void)didMoveToView:(SKView *)view {
    [background spawnTextures:self];
    self.anchorPoint = CGPointMake(0, 0);
    [character_clothes initializeSprites:self imageState:imageState];
    [Save spawn:self];
}
- (void)tapMove:(SKScene*)s location:(CGPoint)p node:(SKNode*)n {
    
}
- (void)touchMovedToPoint:(CGPoint)pos {
    
}
- (void)touchUpAtPoint:(CGPoint)pos{
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    [selection_bar onTouch:obj imgst:imageState];
    [character_clothes onTouch:obj];
    [Save onTouch:obj scene:self];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    [skinColour touchDown:(SKSpriteNode*)obj location:loc];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
}
-(void)update:(CFTimeInterval)currentTime {
    [background updating];
}

@end
