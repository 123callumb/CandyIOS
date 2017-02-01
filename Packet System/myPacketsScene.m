//
//  myPacketsScene.m
//  Candy
//
//  Created by Callum Beckwith on 01/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "myPacketsScene.h"
#import "packetBacking.h"
#import "packetDisplayItem.h"
#import "packetInventoryData.h"
#import "mainTransition.h"
@implementation myPacketsScene

int currentPacketDisplay = 0;

-(void)didMoveToView:(SKView *)view {
    [self setAnchorPoint:CGPointMake(0.5, 0.5)];
    [packetBacking addBacking:self];
    [packetDisplayItem addOwnedPackets:self];
    
    UISwipeGestureRecognizer *gestureRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onGestureRight:)];
    gestureRight.direction = UISwipeGestureRecognizerDirectionLeft;
    [[self view] addGestureRecognizer:gestureRight];
    
    UISwipeGestureRecognizer *gestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onGestureLeft:)];
    gestureLeft.direction = UISwipeGestureRecognizerDirectionRight;
    [[self view] addGestureRecognizer:gestureLeft];
    
}
-(void)onGestureRight: (UISwipeGestureRecognizer*)swipe {
    if(swipe.state == UIGestureRecognizerStateEnded && currentPacketDisplay <= [packetInventoryData getSlotsFull]){
        
        for(int i = 0; i <= [packetInventoryData getSlotsFull]; i++){
        
        SKSpriteNode *packetDisplays = (SKSpriteNode*)[self childNodeWithName:[NSString stringWithFormat:@"packetPane_%d", i]];
        SKAction *moveToLeft = [SKAction moveByX:-self.frame.size.width y:0 duration:0.4];
            
            [packetDisplays runAction:moveToLeft completion:^{
                currentPacketDisplay++;
            }];
            
        }
        
    }
}
-(void)onGestureLeft: (UISwipeGestureRecognizer*)swipe {
    if(swipe.state == UIGestureRecognizerStateEnded && currentPacketDisplay > 0){
        
        for(int i = 0; i <= [packetInventoryData getSlotsFull]; i++){
            
            SKSpriteNode *packetDisplays = (SKSpriteNode*)[self childNodeWithName:[NSString stringWithFormat:@"packetPane_%d", i]];
            SKAction *moveToRight = [SKAction moveByX:self.frame.size.width y:0 duration:0.4];
            
            [packetDisplays runAction:moveToRight completion:^{
                currentPacketDisplay = currentPacketDisplay - 1;
            }];
            
        }
        
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    if([obj.name isEqualToString:@"closeButton"]){
        [mainTransition switchScene:self sceneTwo:@"main" Transition:[SKTransition crossFadeWithDuration:0.4]];
    }
}
@end
