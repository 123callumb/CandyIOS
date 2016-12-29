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
#import "sweetShopUI.h"
#import "sweetInventoryUI.h"

UIScrollView* UIscrollUpdate = nil;
UIImageView *img1 = nil;
@implementation main

-(void)didMoveToView:(SKView *)view {
    //Set Background Foreground, mainly static!
    [menuHandler refreshMenuSystem:self];
    [backgroundManager mainScene:self];
    [mainUI drawUI:self];
    [levelDecider createLevel:self];
    
    //scrollView(Update)
    UIscrollUpdate = [[UIScrollView alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 19, self.view.frame.size.height / 4.2, 8.95*(self.view.frame.size.width /10), 2.38*(self.view.frame.size.height / 4))];
    [scrollUpdate initializeScroll:UIscrollUpdate uiView:self.view];
    [self.view addSubview:UIscrollUpdate];
    for(int i = 0; i<= 8; i++){
        [AddItem CreateItem:@"nil" buttonTexture:@"upgradeButton" yPos:i*(UIscrollUpdate.frame.size.width/4) Scene:UIscrollUpdate ID:i];
    }
    [sweetShopUI addUIView:self.view];    
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
    [buttonHandler registerButtons:obj currentScene:self view:self.view];
    [registerBoxes registerBoxes:obj currentScene:self];
    [registerStatsButtons registerStatsButtons:self location:loc node:obj view:self.view];
    [upgradeMenu onTouch:obj scene:self];
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
