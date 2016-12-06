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
#import "AddItem.h"
#import "scrollUpdate.h"
#import "sweetTypeUI.h"
#import "flavourPicker.h"

UIScrollView* UIscrollUpdate = nil;
UIImageView *img1 = nil;
UIScrollView* sTUI = nil;
UIScrollView* sFUI = nil;
@implementation main

-(void)didMoveToView:(SKView *)view {
    //Set Background Foreground, mainly static!
    [menuHandler refreshMenuSystem:self];
    [backgroundManager mainScene:self];
    [mainUI drawUI:self];
    [levelDecider createLevel:self];
    
    
    //scrollview(inventory)
    sTUI = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/1.44, -self.view.frame.size.height/2.82)];
    [sweetTypeUI addMethodsToView:sTUI scene:self.view];
    [self.view addSubview:sTUI];
    
    sFUI = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/1.44, -self.view.frame.size.height/2.82)];
    [flavourPicker addFlavourPickerToView:sFUI scene:self.view];
    [self.view addSubview:sFUI];
    
    //scrollView(Update)
    UIscrollUpdate = [[UIScrollView alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 19, self.view.frame.size.height / 4.2, 8.95*(self.view.frame.size.width /10), 2.38*(self.view.frame.size.height / 4))];
    [scrollUpdate initializeScroll:UIscrollUpdate uiView:self.view];
    [self.view addSubview:UIscrollUpdate];
    for(int i = 0; i<= 8; i++){
        [AddItem CreateItem:@"nil" buttonTexture:@"upgradeButton" yPos:i*(UIscrollUpdate.frame.size.width/4) Scene:UIscrollUpdate ID:i];
    }
    }

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    if(loc.y >= -470){
    [candyMachines onTouch:obj];
    }
    [upgradeMenu SwitchingMenu:self node:obj];
    [taps onPressed:self location:loc];
    [buttonHandler registerButtons:obj currentScene:self];
    [registerBoxes registerBoxes:obj currentScene:self];
    [registerStatsButtons registerStatsButtons:self location:loc node:obj];
}

//These methods are new and pretty dank af!
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *tap = [touches anyObject];
    CGPoint loc = [tap locationInNode:self];
    SKNode *obj = [self nodeAtPoint:loc];
    
    [taps onMovement:self location:loc node:obj];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [taps onRelease:self];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}

-(void)update:(CFTimeInterval)currentTime {

}
@end
