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
#import "levelDecider.h"
#import "registerBoxes.h"
#import "registerStatsButtons.h"
#import "menuHandler.h"
#import "candyMachines.h"
#import "money.h"
#import "coinBarSprite.h"
#import "upgradeMenu.h"
#import "scrollUpdate.h"
#import "sweetTypeUI.h"
#import "flavourPicker.h"
#import "sweetShopUI.h"
#import "sweetInventoryUI.h"
#import "coinBarSprite.h"
#import "tutorialMessages.h"
#import "menuUi.h"
#import "menuUIButtons.h"
#import "candyMachineAutoSpawner.h"
#import "optimiseCandyMachineData.h"

UIScrollView* UIscrollUpdate = nil;
UIImageView *img1 = nil;
@implementation main

-(void)didMoveToView:(SKView *)view {
    //Set Background Foreground, mainly static!
    [menuHandler refreshMenuSystem:self];
    [backgroundManager mainScene:self];
    [mainUI drawUI:self];
    [levelDecider createLevel:self];
    [tutorialMessages firstTimeLoadMessages:self.view];
    
    //scrollView(Update)
    [scrollUpdate initializeScrollRegular:self];
    [scrollUpdate initializeScrollSpecial:self];
    
    [sweetShopUI addUIView:self.view];
    
    
    //Add Gesture Rec
    UISwipeGestureRecognizer *gestureRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onGestureRight:)];
    gestureRight.direction = UISwipeGestureRecognizerDirectionLeft;
    [[self view] addGestureRecognizer:gestureRight];
    
    UISwipeGestureRecognizer *gestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onGestureLeft:)];
    gestureLeft.direction = UISwipeGestureRecognizerDirectionRight;
    [[self view] addGestureRecognizer:gestureLeft];
    
    
    //Start Auto Candy Machines
    [candyMachineAutoSpawner startAutoCandyMachines:self];
    [optimiseCandyMachineData resetSlotArray];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    [upgradeMenu SwitchingMenu:self node:obj];
    [taps onPressed:self location:loc view:self.view];
    [buttonHandler registerButtons:obj currentScene:self view:self.view];
    [registerBoxes registerBoxes:obj currentScene:self];
    [registerStatsButtons registerStatsButtons:self location:loc node:obj view:self.view];
    //[upgradeMenu onTouch:obj scene:self];
}

//These methods are new and pretty dank af!
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    [taps onMovement:self location:loc node:obj];
}

-(void)onGestureRight: (UISwipeGestureRecognizer*)swipe {
    if(swipe.state == UIGestureRecognizerStateEnded){
        [menuUi removeMenu:self.view];
    }
}
-(void)onGestureLeft: (UISwipeGestureRecognizer*)swipe {
    if(swipe.state == UIGestureRecognizerStateEnded){
        [menuUi createMenu:self.view];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [taps onRelease:self];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}

-(void)update:(CFTimeInterval)currentTime {
    //God i really hope this doesn't cause lag
    [coinBarSprite updateText:self];
    [menuUIButtons menuUpdateChecker:self view:self.view];
}
@end
