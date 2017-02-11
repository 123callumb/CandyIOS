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
#import "buttonAnimation.h"

@implementation myPacketsScene

int currentPacketDisplay;

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
    
    currentPacketDisplay = 0;
    
}
-(void)onGestureRight: (UISwipeGestureRecognizer*)swipe {
    if(swipe.state == UIGestureRecognizerStateEnded && currentPacketDisplay < [packetInventoryData getSlotsFull] - 1){
        
        for(int i = 0; i <= [packetInventoryData getSlotsFull]; i++){
        
        SKSpriteNode *packetDisplays = (SKSpriteNode*)[self childNodeWithName:[NSString stringWithFormat:@"packetPane_%d", i]];
        SKAction *moveToLeft = [SKAction moveByX:-self.frame.size.width y:0 duration:0.4];
            
            [packetDisplays runAction:moveToLeft completion:^{
                
            }];
            
        }
        currentPacketDisplay++;
        
    }
}
-(void)onGestureLeft: (UISwipeGestureRecognizer*)swipe {
    if(swipe.state == UIGestureRecognizerStateEnded && currentPacketDisplay > 0){
        
        for(int i = 0; i <= [packetInventoryData getSlotsFull]; i++){
            
            SKSpriteNode *packetDisplays = (SKSpriteNode*)[self childNodeWithName:[NSString stringWithFormat:@"packetPane_%d", i]];
            SKAction *moveToRight = [SKAction moveByX:self.frame.size.width y:0 duration:0.4];
            
            [packetDisplays runAction:moveToRight completion:^{
               
            }];
            
        }
        currentPacketDisplay = currentPacketDisplay - 1;
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    if([obj.name isEqualToString:@"closeButton"]){
        currentPacketDisplay = 0;
        [mainTransition switchScene:self sceneTwo:@"main" Transition:[SKTransition crossFadeWithDuration:0.4]];
    }
    
    if([obj.name isEqualToString:[NSString stringWithFormat:@"openPacketButton_ID_%d", currentPacketDisplay]]){
        [buttonAnimation changeState:obj changeName:@"openGreenButtonPressed" originalName:@"openGreenButton"];
        SKAction *wait = [SKAction waitForDuration:0.3];
        [obj runAction:wait completion:^{
            [mainTransition switchScene:self sceneTwo:@"openPacket" Transition:[SKTransition fadeWithColor:[UIColor blackColor] duration:0.3]];
        }];
    }
    
    if([obj.name isEqualToString:@"buyButton"]){
        [mainTransition switchScene:self sceneTwo:@"coinStore" Transition:[SKTransition crossFadeWithDuration:0.4]];
    }
}
+(int)getCurrentPacket {
    return currentPacketDisplay;
}
+(void)resetCurrentPack {
    currentPacketDisplay = 0;
}
@end
