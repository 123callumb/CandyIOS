//
//  mapMachineUI.m
//  Candy
//
//  Created by Callum Beckwith on 19/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "mapMachineUI.h"
#import "buildingData.h"
#import "mapBuildingUI.h"
#import "mapMachineSlots.h"
#import "money.h"
#import "candyMachineValues.h"
#import "messageUI.h"
#import "mapBuildingUI.h"

@implementation mapMachineUI

int currentMapMachineID;

+(int)getCurrentMapMachineID {
    return currentMapMachineID;
}

+(void)createMachineUi:(UIView*)view machineID:(int)machineID {
    
    currentMapMachineID = machineID;
    
    float viewHeight = view.frame.size.height/1.35;
    float viewWidth = view.frame.size.width/1.1;
    
    UIView *machineView = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width, view.frame.size.height/2 - viewHeight/2, viewWidth, viewHeight)];
    UIImage *viewBacking = [UIImage imageNamed:@"mapMachineUI"];
    UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    [backView setImage:viewBacking];
    
    //Cross Button
    UIImage *crossImage = [UIImage imageNamed:@"crossButton"];
    UIButton *cross = [UIButton buttonWithType:UIButtonTypeCustom];
    [cross setFrame:CGRectMake(viewWidth/26, viewWidth/4.6, viewWidth/6, viewWidth/6)];
    [cross setImage:crossImage forState:UIControlStateNormal];
    [cross addTarget:self action:@selector(onClose:) forControlEvents:UIControlEventTouchUpInside];

    
    //Display Correct Machine
    //UIImageView *machineBacking = [[UIImageView alloc] initWithFrame:CGRectMake(viewWidth/10, viewHeight/4, viewWidth/2.5, viewWidth/2.5)];
    //UIImage *machineBackingImage = [UIImage imageNamed:@""];
    UIImage *machineImage = [UIImage imageNamed:[buildingData getMachineTextureFromBuildingWithID:[mapBuildingUI getCurrentMapBuildingID] andMachineID:currentMapMachineID]];
    UIImageView *machineImageView = [[UIImageView alloc] initWithImage:machineImage];
    [machineImageView setFrame:CGRectMake(viewWidth/7, viewHeight/4.5, viewWidth/2.8, viewWidth/2.5)];
    
    
    [machineView addSubview:backView];
    
    //Add sweet Slots
    [mapMachineSlots addMachineSlots:machineView];
    
    //Add UIpgrade Buttons
    UIImage *coinBarImage = [UIImage imageNamed:@"machineCoinUpgradePrice"];
    UIImage *upgradeButtonImage = [UIImage imageNamed:@"machineUpgradeButton"];
    UIImage *gemBarImage = [UIImage imageNamed:@"gemUpgradePrice"];
    UIImage *slotUpgradeButtonImage = [UIImage imageNamed:@"machineSlotUpgradeButton"];
    
    CGSize barDimensions = CGSizeMake(viewWidth/2, viewHeight/9);
    
    UIImageView *coinBar = [[UIImageView alloc] initWithImage:coinBarImage];
    UIImageView *gemBar = [[UIImageView alloc] initWithImage:gemBarImage];
    
    UIButton *upgradeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *slotButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [coinBar setFrame:CGRectMake(viewWidth/14, viewHeight/2, barDimensions.width, barDimensions.height)];
    [upgradeButton setFrame:CGRectMake(viewWidth/14, viewHeight/2 + barDimensions.height, barDimensions.width, barDimensions.height)];
    [gemBar setFrame:CGRectMake(viewWidth/14, viewHeight/2 + barDimensions.height * 2, barDimensions.width, barDimensions.height)];
    [slotButton setFrame:CGRectMake(viewWidth/14, viewHeight/2 + barDimensions.height * 3, barDimensions.width, barDimensions.height)];
    
    [upgradeButton setImage:upgradeButtonImage forState:UIControlStateNormal];
    [slotButton setImage:slotUpgradeButtonImage forState:UIControlStateNormal];
    
    [upgradeButton addTarget:self action:@selector(onUpgradeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [backView addSubview:machineImageView];
    [machineView addSubview:cross];
    [machineView addSubview:coinBar];
    [machineView addSubview:upgradeButton];
    [machineView addSubview:gemBar];
    [machineView addSubview:slotButton];
    
    [UIView animateWithDuration:0.15 animations:^{
        [view addSubview:machineView];
        [machineView setFrame:CGRectMake(view.frame.size.width/2 - viewWidth/2, view.frame.size.height/2 - viewHeight/2, viewWidth, viewHeight)];
    } completion:^(BOOL finished){
        NSLog(@"Opened UI for machine with id: %d", machineID);
    }];
}
+(void)onClose:(id)sender {
    
    UIButton *cross = (UIButton*)sender;
    UIView *machineView = [cross superview];
    UIView *main = [machineView superview];
    
    [UIView animateWithDuration:0.15 animations:^{
        [machineView setFrame:CGRectMake(machineView.frame.size.width, machineView.frame.origin.y, machineView.frame.size.width, machineView.frame.size.height)];
        [mapBuildingUI openBuildingUIForBuildingWithID:[mapBuildingUI getCurrentMapBuildingID] forView:main];
    } completion:^(BOOL finished){
        [machineView removeFromSuperview];
    }];
}
+(void)onUpgradeButton:(UIButton*)sender {
    
    UIButton *upgrade = (UIButton*)sender;
    UIView *machineView = [upgrade superview];
    UIView *main = [machineView superview];
    
    int currentBuildingID = [mapBuildingUI getCurrentMapBuildingID];
    int nextMachineRankPrice = [candyMachineValues upgradePrices:[buildingData getMachineRankFromBuildingWithID:currentBuildingID andMachineID:currentMapMachineID]];
    
    if(nextMachineRankPrice < [money getBalance]){
        [money addBalance:-nextMachineRankPrice];
        [buildingData upgradeMachineWithID:currentMapMachineID fromBuilding:currentBuildingID];
        [self onClose:sender];
        [messageUI createMessageBox:main information:@"Woop! You just upgraded one of you candy Machines!" representingImage:@"machine_default" imageScale:0.5 messageBoxID:69 displayOnce:false];
    }else {
        [messageUI createMessageBox:main information:@"Awww you can't afford this :(" representingImage:@"dunnoButton" imageScale:0.5 messageBoxID:69 displayOnce:false];
    }
    
    
}
+(void)onSlotUpgradeButton:(UIButton*)sender {
    
}
@end
