//
//  mapBuildingSlots.m
//  Candy
//
//  Created by Callum Beckwith on 18/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "mapBuildingSlots.h"
#import "buildingData.h"
#import "mapMachineUI.h"
#import "mapBuildingUI.h"

@implementation mapBuildingSlots

+(void)addSlotsForBuildingWithID:(int)building onView:(UIView*)view {
    
    for (int i = 0; i < 8; i++) {
        UIImage *slotHolder = [UIImage imageNamed:@"mapBuildingTile"];
        NSString *machineTexture = [buildingData getMachineTextureFromBuildingWithID:[mapBuildingUI getCurrentMapBuildingID] andMachineID:i];
        UIImage *candyMachineTexture = [UIImage imageNamed:machineTexture];
        
        UIImageView *slotBase = [[UIImageView alloc] initWithImage:slotHolder];
        [slotBase setUserInteractionEnabled:true];
        float slotArea = view.frame.size.width/4.5;
        float yVal;
        float xVal = 0;
        
        if(i > 3){
            yVal = view.frame.size.height/2;
        }else {
            yVal = view.frame.size.height/3.1;
        }
        
        
        if(i > 3){
            xVal = 4;
        }
        
        float padding = (view.frame.size.width - (slotArea * 4))/2;
        [slotBase setFrame:CGRectMake(padding + (slotArea * (i - xVal)), yVal, slotArea, slotArea)];
        
        UIButton *slotButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [slotButton setImage:candyMachineTexture forState:UIControlStateNormal];
        [slotButton setFrame:CGRectMake(slotArea/2 - slotArea * 0.3, slotArea/2 - slotArea * 0.3, slotArea * 0.6, slotArea * 0.6)];
        [slotButton addTarget:self action:@selector(onSlotPress:) forControlEvents:UIControlEventTouchUpInside];
        
        [slotBase addSubview:slotButton];
        [slotButton setTag:i];
        
        [view addSubview:slotBase]; 
    }
}

+(void)onSlotPress:(UIButton*)sender {
    UIButton *machineButton = (UIButton*)sender;
    UIView *baseView = [machineButton superview];
    UIView *buildingUI = [baseView superview];
    UIView *mainView = [buildingUI superview];
    int machineID = (int)[machineButton tag];
    
    [UIView animateWithDuration:0.15 animations:^{
        [buildingUI setFrame:CGRectMake(-mainView.frame.size.width, buildingUI.frame.origin.y, buildingUI.frame.size.width, buildingUI.frame.size.height)];
        [mapMachineUI createMachineUi:mainView machineID:machineID];
    } completion:^(bool finished){
        [buildingUI removeFromSuperview];
    }];
}

@end
