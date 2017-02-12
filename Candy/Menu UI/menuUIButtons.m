//
//  menuUIButtons.m
//  Candy
//
//  Created by Callum Beckwith on 02/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "menuUIButtons.h"
#import "mainTransition.h"
#import "menuUi.h"
#import "sweetInventoryUI.h"
#import "tutorialMessages.h"
#import "spinData.h"
#import "trendsMain.h"
#import "gemGemeratorGui.h"
#import "buildingUI.h"
#import "menuHandler.h"
#import "messageUI.h"
#import "itemPacksUI.h"

@implementation menuUIButtons

int menuNo = -1;

+(NSArray*)menuButtons {
    NSArray *buttons = [NSArray arrayWithObjects:
                        @"enableBonus",
                        @"freeItemsButton",
                        @"itemPacksButton",
                        @"achievementsButton",
                        @"coinStoreButton",
                        @"sweetMenuButton",
                        @"dailySpinButton",
                        @"sweetTrendsButton",
                        @"gemButton",
                        @"playerStatsIcon",
                        @"myPacketsSmallButton",
                        @"upgradeSmallButton",
                        @"buildingMenuButton",
                        nil];
    return buttons;
}
+(void)addButtons: (UIView*)v {
    for(int i = 0; i <= [[self menuButtons] count] - 1; i++){
        [self createButton:v buttonNumber:i];
    }
}
+(void)createButton: (UIView*)v buttonNumber:(int)butNo {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [UIImage imageNamed:[[self menuButtons] objectAtIndex:butNo]];
    
    float buttonW = v.frame.size.width/1.2;
    float buttonH = v.frame.size.height/3.5;
    
    if([[[self menuButtons] objectAtIndex:butNo] isEqualToString:@"enableBonus"]){
        buttonH = v.frame.size.height/8;
    }
    if(![[[self menuButtons] objectAtIndex:butNo] isEqualToString:@"enableBonus"]){
    button.frame = CGRectMake(v.frame.size.width/2.1 - buttonW/2, buttonH * butNo + v.frame.size.height/30 - v.frame.size.height/6.5, buttonW, buttonH);
    }else {
        button.frame = CGRectMake(v.frame.size.width/2.1 - buttonW/2, buttonH * butNo + v.frame.size.height/30, buttonW, buttonH);
    }
    [button setImage:buttonImage forState:UIControlStateNormal];
    
    button.tag = 100000 + butNo;
    
    [button addTarget:self action:@selector(onButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    [v addSubview:button];
}
+(void)onButtonPress: (id)sender {
    UIButton *button = (UIButton*)sender;
    UIView *v = [button superview];
    UIView *v1 = [v superview];
    
    int buttonNo = (int)button.tag - 100000;
    [menuUi removeMenu:v1];
    menuNo = buttonNo;
    
}
+(void)menuUpdateChecker: (SKScene*)s view:(UIView*)v {
    if(menuNo == 0){
        menuNo = -1;
        [messageUI createMessageBox:v information:@"This will allow you to receive more money per tap while an advert is displayed at the bottom of the screen. Thanks for supporting us!" representingImage:@"enableBonus" imageScale:0.3 messageBoxID:46 displayOnce:false];
    }
    if(menuNo == 1){
        menuNo = -1;
        [mainTransition switchScene:s sceneTwo:@"freeItems" Transition:[SKTransition crossFadeWithDuration:0.3]];
    }
    if(menuNo == 2){
        menuNo = -1;
        [itemPacksUI createItemPackUI:v];
    }
    if(menuNo == 3){
        menuNo = -1;
 
    }
    if(menuNo == 4){
        menuNo = -1;
        [mainTransition switchScene:s sceneTwo:@"coinStore" Transition:[SKTransition crossFadeWithDuration:0.3]];
        [tutorialMessages firstTimeStoreButton:v];
    }
    if(menuNo == 5){
        menuNo = -1;
        [sweetInventoryUI showSweetInventoryUI:v];
        [tutorialMessages firstTimeSweetInvButton:v];
    }
    if(menuNo == 6){
        menuNo = -1;
        if([spinData isEligibleForDailySpin]){
            [mainTransition switchScene:s sceneTwo:@"dailySpin" Transition:[SKTransition crossFadeWithDuration:0.3]];
        }else {
            [tutorialMessages spinTimeLeft:v];
        }
    }
    if(menuNo == 7){
        menuNo = -1;
        [trendsMain createTrendsMenu:v];
        [tutorialMessages firstTimeTrends:v];
    }
    if(menuNo == 8){
        menuNo = -1;
        [menuHandler setCurrentMenu:8];
        [gemGemeratorGui createGemMenu:s];
        [tutorialMessages firstTimeGemeratorButton:v];
    }
    if(menuNo == 9){
        menuNo = -1;
        [mainTransition switchScene:s sceneTwo:@"Character_Maker" Transition:[SKTransition crossFadeWithDuration:0.3]];
    }
    if(menuNo == 10){
        menuNo = -1;
        [mainTransition switchScene:s sceneTwo:@"myPackets" Transition:[SKTransition crossFadeWithDuration:0.3]];
    }
    if(menuNo == 11){
        menuNo = -1;
    }
    if(menuNo == 12){
        menuNo = -1;
        [menuHandler setCurrentMenu:12];
        [buildingUI createBuildingUI:s];
    }
    
}
@end
