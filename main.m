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

UIScrollView* scrollViewGeneral = nil;
UIScrollView* scrollViewSpecial = nil;
@implementation main

-(void)didMoveToView:(SKView *)view {
    //Set Background Foreground, mainly static!
    [menuHandler refreshMenuSystem:self];
    [backgroundManager mainScene:self];
    [mainUI drawUI:self];
    [levelDecider createLevel:self];
    
    //scrollViewGeneral
    UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 337, 100)];
    img1.image = [UIImage imageNamed:@"hueBar"];
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 337, 100)];
    img2.image = [UIImage imageNamed:@"hueBar"];
    UIImageView *img3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200, 337, 100)];
    img3.image = [UIImage imageNamed:@"hueBar"];
    UIImageView *img4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, 337, 100)];
    img4.image = [UIImage imageNamed:@"hueBar"];
    UIImageView *img5 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 400, 337, 100)];
    img5.image = [UIImage imageNamed:@"hueBar"];
    UIImageView *img6 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 500, 337, 100)];
    img6.image = [UIImage imageNamed:@"hueBar"];
    
    scrollViewGeneral = [[UIScrollView alloc]initWithFrame:CGRectMake(19, 159, 337, 396)];
    scrollViewGeneral.backgroundColor = [UIColor whiteColor];
    [scrollViewGeneral setContentSize:CGSizeMake(337, 900)];
    [self.view addSubview:scrollViewGeneral];
    scrollViewGeneral.hidden = true;
    
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(19,159,337,200)];
    redView.backgroundColor = [UIColor redColor];
    
    [scrollViewGeneral addSubview:img1];
    [scrollViewGeneral addSubview:img2];
    [scrollViewGeneral addSubview:img3];
    [scrollViewGeneral addSubview:img4];
    [scrollViewGeneral addSubview:img5];
    [scrollViewGeneral addSubview:img6];
    //scrollViewSpecial
    scrollViewSpecial = [[UIScrollView alloc]initWithFrame:CGRectMake(19, 159, 337, 396)];
    scrollViewSpecial.backgroundColor = [UIColor whiteColor];
    [scrollViewSpecial setContentSize:CGSizeMake(337, 900)];
    [self.view addSubview:scrollViewSpecial];
    scrollViewSpecial.hidden = true;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
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
//showing/closing scrollview
+(void)scrollViewGeneralController:(BOOL)b{
    scrollViewGeneral.hidden = b;
}
+(void)scrollViewSpecialController:(BOOL)b{
    scrollViewSpecial.hidden = b;
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
