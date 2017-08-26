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
#import "objectivesGold.h"
#import "objectivesSilver.h"
#import "objectivesBronze.h"
#import "tipsUI.h"
#import "bannerBonusUI.h"
#import "candyMachineInteraction.h"
#import "sweetInventoryData.h"
#import "worldMap.h"
#import "buildingType.h"

UIScrollView* UIscrollUpdate = nil;
UIImageView *img1 = nil;
@implementation main


-(void)didMoveToView:(SKView *)view {
    //Set Background Foreground, mainly static!
    [menuHandler refreshMenuSystem:self];
    [backgroundManager mainScene:self];
    [mainUI drawUI:self];
    [levelDecider createLevel:self];
    
    //Tutorial Stuff
    if([[sweetInventoryData getInventory] count] >= 1){
        [tutorialMessages firstTimeOpenedPacket:self.view];
    }
    [tutorialMessages firstTimeLoadMessages:self.view];
    
    //scrollView(Update)
    [scrollUpdate initializeScrollRegular:self];
    [scrollUpdate initializeScrollSpecial:self];
    
    [sweetShopUI addUIView:self.view];
    
    //Objective Complete Checkers
    [objectivesGold object0:self.view];
    [objectivesGold object1:self.view];
    
    //Add Gesture Rec
    UISwipeGestureRecognizer *gestureRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onGestureRight:)];
    gestureRight.direction = UISwipeGestureRecognizerDirectionLeft;
    [[self view] addGestureRecognizer:gestureRight];
    
    UISwipeGestureRecognizer *gestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onGestureLeft:)];
    gestureLeft.direction = UISwipeGestureRecognizerDirectionRight;
    [[self view] addGestureRecognizer:gestureLeft];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPress:)];
    longPress.minimumPressDuration = 0.4;
    [[self view] addGestureRecognizer:longPress];
    
    //Start Auto Candy Machines
    [candyMachineAutoSpawner startAutoCandyMachines:self];
    [optimiseCandyMachineData resetSlotArray];
    
    //Start Tip System
    [tipsUI startTipSpawner:self];
    
    //Set Bonus Banner Settings
    [bannerBonusUI addBonusBanner:self.view];

    //Dealloc all gestures for the world scene
    if([buildingType getCurrentBuildingID] == 8){
        [self.view removeGestureRecognizer:longPress];
        [self.view removeGestureRecognizer:gestureLeft];
        [self.view removeGestureRecognizer:gestureRight];
    }
    
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
        CGPoint touchLocation = [swipe.self locationOfTouch:0 inView:swipe.view];

        if(touchLocation.x < self.view.frame.size.width/8){
            [menuUi createMenu:self.view];
        }
    }
}
-(void)onLongPress: (UILongPressGestureRecognizer*)longPress {\
    
    CGPoint touchLocation = [longPress.self locationOfTouch:0 inView:longPress.view];
    CGPoint objLoc = [[self.scene view] convertPoint:touchLocation toScene:self.scene];
    SKNode *obj = [self nodeAtPoint:objLoc];
    
    if (longPress.state == UIGestureRecognizerStateBegan) {
        [candyMachineInteraction onCandyFirstMachineTouch:(SKSpriteNode*)obj scene:self view:self.view];
    }
    if (longPress.state == UIGestureRecognizerStateEnded) {
       
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
