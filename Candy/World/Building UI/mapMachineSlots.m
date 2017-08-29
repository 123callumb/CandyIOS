//
//  mapMachineSlots.m
//  Candy
//
//  Created by Callum Beckwith on 21/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "mapMachineSlots.h"
#import "buildingData.h"
#import "mapMachineUI.h"
#import "mapBuildingUI.h"
#import "candyMachineSlotData.h"
#import "mapMachineSweetDraw.h"

@implementation mapMachineSlots

+(void)addMachineSlots:(UIView*)machineView {
    
    NSArray *slotSweetUUIDs = [buildingData getMachineSlotUUIDSFromBuildingWithID:[mapBuildingUI getCurrentMapBuildingID] andMachineID:[mapMachineUI getCurrentMapMachineID]];
    
    NSDictionary *machineData = [buildingData getMachineDataWithID:[mapMachineUI getCurrentMapMachineID] fromBuilding:[mapBuildingUI getCurrentMapBuildingID]];
    int machineSlotsUnlocked = [[machineData objectForKey:@"slotRank"] intValue];
    
    for(int i = 0; i < 3; i++){
        UIImage *slotBackground = [UIImage imageNamed:@"sweetDrawSlot"];
        UIImageView *slotBacking = [[UIImageView alloc] initWithImage:slotBackground];
        
        float slotArea = machineView.frame.size.width/3;
        
        [slotBacking setFrame:CGRectMake(machineView.frame.size.width/1.65, (machineView.frame.size.height/4) + (i*slotArea), slotArea, slotArea)];
        
        NSNumber *slotUUIDs = [slotSweetUUIDs objectAtIndex:i];
        long slotUUID = [slotUUIDs longValue];
        NSString *sweetTexture;
        float sweetArea = slotArea/1.25;
        
        //NSLog(@"%d <= %d", machineSlotsUnlocked, i);
        
        if(i <= machineSlotsUnlocked){
            if(slotUUID == -1){
                sweetTexture = @"sweetDrawSlot";
                sweetArea = slotArea;
            }else{
                sweetTexture = [candyMachineSlotData getTextureFromSweetUUID:slotUUID];
            }
            
            [slotBacking setUserInteractionEnabled:true];
            
        }else {
            sweetTexture = @"padlock";
            sweetArea = slotArea/2;
            [slotBacking setUserInteractionEnabled:false];
        }
        
        UIImage *slotImage = [UIImage imageNamed:sweetTexture];
        UIButton *sweetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [sweetButton setImage:slotImage forState:UIControlStateNormal];
        [sweetButton setTag:i + 1]; //we have to add one becuase the nsdictionary value starts at slot1 not slot0
        [sweetButton addTarget:self action:@selector(onSlotPress:) forControlEvents:UIControlEventTouchUpInside];
        
        [sweetButton setFrame:CGRectMake(slotArea/2 - sweetArea/2, slotArea/2 - sweetArea/2, sweetArea, sweetArea)];
        
        [slotBacking addSubview:sweetButton];
        
        [machineView addSubview:slotBacking];
    }
    
}
+(void)onSlotPress:(UIButton*)sender {
    UIButton *button = (UIButton*)sender;
    UIView *view = [button superview];
    UIView *main = [view superview];
    UIView *upper = [main superview];
    int slotTag = (int)[button tag];
    [mapMachineSweetDraw createSweetDrawForMachineSlot:slotTag onView:upper];
    
    [UIView animateWithDuration:0.3 animations:^{
        [main setFrame:CGRectMake(-main.frame.size.width, main.frame.origin.y, main.frame.size.width, main.frame.size.height)];
    } completion:^(bool finished){
        [main removeFromSuperview];
    }];
}

@end
