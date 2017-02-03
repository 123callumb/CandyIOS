//
//  coinStoreUI.m
//  Candy
//
//  Created by Callum Beckwith on 06/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "coinStoreUI.h"
#import "floorStore.h"
#import "deskStore.h"
#import "workstationStore.h"
#import "packetStore.h"

@implementation coinStoreUI

+(void)addCoinStoreUI: (UIView*)v {
    UIView *mainStoreView = [[UIView alloc] initWithFrame:CGRectMake(0, v.frame.size.height/3.37, v.frame.size.width, v.frame.size.height - v.frame.size.height/3.4)];
    mainStoreView.tag = 20000;
    [self addMainMenu:mainStoreView];
    [v addSubview:mainStoreView];
}
+(void)addMainMenu: (UIView*)v {
    UIScrollView *menuScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
    menuScrollView.contentSize = CGSizeMake(v.frame.size.width, v.frame.size.height*2 + (v.frame.size.height*2)/7);
    [self addMenuButtons:menuScrollView];
    [v addSubview:menuScrollView];
}
+(void)removeCoinStore: (UIView*)v {
    UIView *mainStore = [v viewWithTag:20000];
    [mainStore removeFromSuperview];
}
+(void)addMenuButtons: (UIScrollView*)v {
    [self createButton:v textureName:@"packetsButtonStore" buttonID:0];
    [self createButton:v textureName:@"floorsButton" buttonID:1];
    [self createButton:v textureName:@"desksButton" buttonID:2];
    [self createButton:v textureName:@"workstationsButton" buttonID:3];
    [self createButton:v textureName:@"hatsButtonTemp" buttonID:4];
    [self createButton:v textureName:@"shirtsButtonTemp" buttonID:5];
    [self createButton:v textureName:@"pantsButtonTemp" buttonID:6];
    [self createButton:v textureName:@"shoesButtonTemp" buttonID:7];
}
+(void)createButton: (UIScrollView*)v textureName:(NSString*)textureName buttonID:(int)buttonID {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [UIImage imageNamed:textureName];
    
    [button setImage:buttonImage forState:UIControlStateNormal];
    
    float buttonW = v.frame.size.width;
    float buttonH = v.frame.size.height/3.5;
    
    button.frame = CGRectMake(0, buttonH * buttonID, buttonW, buttonH);
    button.tag = 20001 + buttonID;
    
    SEL onStoreTypePress = @selector(onButtonPress:);
    
    [button addTarget:self action:onStoreTypePress forControlEvents:UIControlEventTouchUpInside];
    
    [v addSubview:button];
}
+(void)onButtonPress: (id)sender {
    
    UIButton *button = (UIButton*)sender;
    UIScrollView *sv = (UIScrollView*)[button superview];
    UIView *v = [sv superview];
    
    int buttonID = (int)button.tag - 20001;
    if(buttonID == 0){
        [packetStore addPacketStoreUI:v];
    }
    if(buttonID == 1){
        [floorStore addFloorStoreUI:v];
    }
    if(buttonID == 2){
        [deskStore addDeskStoreUI:v];
    }
    if(buttonID == 3){
        [workstationStore addWorkstationStoreUI:v];
    }
}
@end
