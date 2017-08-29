//
//  mapMachineSweetDraw.m
//  Candy
//
//  Created by Callum Beckwith on 26/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "mapMachineSweetDraw.h"
#import "sweetInventoryData.h"
#import "sweetInventorySlot.h"
#import "candyMachineSweetsEquiped.h"
#import "sweetUUID.h"
#import "buildingData.h"
#import "mapBuildingUI.h"
#import "mapMachineUI.h"
#import "mapSweetsEquipped.h"

@implementation mapMachineSweetDraw

int currentSlot;

+(void)createSweetDrawForMachineSlot:(int)slotID onView:(UIView*)view {
    
    currentSlot = slotID;
    
    float viewHeight = view.frame.size.height/1.35;
    float viewWidth = view.frame.size.width/1.1;
    
    UIView *drawView = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width, view.frame.size.height/2 - viewHeight/2, viewWidth, viewHeight)];
    UIImage *viewBacking = [UIImage imageNamed:@"mapMachineUI"];
    UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    [backView setImage:viewBacking];
    
    //Cross Button
    UIImage *crossImage = [UIImage imageNamed:@"crossButton"];
    UIButton *cross = [UIButton buttonWithType:UIButtonTypeCustom];
    [cross setFrame:CGRectMake(viewWidth/26, viewWidth/4.6, viewWidth/6, viewWidth/6)];
    [cross setImage:crossImage forState:UIControlStateNormal];
    
    [drawView addSubview:backView];
    [drawView addSubview:cross];
    
    [self createInvSelectionUI:drawView];
    
    [UIView animateWithDuration:0.15 animations:^{
        [view addSubview:drawView];
        [drawView setFrame:CGRectMake(view.frame.size.width/2 - viewWidth/2, view.frame.size.height/2 - viewHeight/2, viewWidth, viewHeight)];
    } completion:^(BOOL finished){
       
    }];
}
+(void)createInvSelectionUI: (UIView*)v {
    float uiWidth = v.frame.size.width/1.4;
    float uiHeight = v.frame.size.height/1.22;
    
    UIScrollView *drawSlotsUi = [[UIScrollView alloc] initWithFrame:CGRectMake(v.frame.size.width/2 - uiWidth/2.5, v.frame.size.height - uiHeight*1.033, uiWidth, uiHeight)];
    
    if([[sweetInventoryData getInventory] count] >= 1 && [sweetInventoryData getInventory] != nil){
        drawSlotsUi.contentSize = CGSizeMake(drawSlotsUi.frame.size.width, (drawSlotsUi.frame.size.width/2)*(([[sweetInventoryData getInventory] count]+1)/2));
        for(int i = 0; i <= [[sweetInventoryData getInventory] count] - 1; i++){
            [self createSlot:drawSlotsUi slotNo:i];
        }
    }else {
        //Draw No Inventory Items Here
    }
    
    [drawSlotsUi setUserInteractionEnabled:true];
    [v addSubview:drawSlotsUi];
}
+(void)createSlot: (UIView*)v slotNo:(int)slotID {
    NSMutableDictionary *slotData = [sweetInventoryData getSweetDataAtSlot:slotID];
    NSString *textureName = [slotData objectForKey:@"sweet_texture"];
    NSString *colourRarity = [slotData objectForKey:@"sweet_color"];
    NSNumber *sweetUUID = [slotData objectForKey:@"sweet_uuid"];
    NSString *slotBackgroundName = [sweetInventorySlot getSlotBackgroundImage:colourRarity];
    long uuidAsLong = [sweetUUID longValue];
    
    
    UIView *slot = [[UIView alloc] initWithFrame:[self layoutStyle:v.frame.size.width/3.2 Padding:v.frame.size.width/40 drawNo:slotID]];
    
    UIButton *sweet = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *slotBgImage = [UIImage imageNamed:slotBackgroundName];
    UIImageView *slotBg = [[UIImageView alloc] initWithImage:slotBgImage];
    UIImage *sweetTeture = [UIImage imageNamed:textureName];
    
    float sweetWidth = slot.frame.size.width/1.5;
    float sweetHeight = slot.frame.size.height/1.5;
    
    slotBg.frame = CGRectMake(0, 0, slot.frame.size.width, slot.frame.size.height);
    sweet.frame = CGRectMake(slot.frame.size.width/2 - sweetWidth/2, slot.frame.size.height/2 - sweetHeight/2, sweetWidth, sweetHeight);
    
    sweet.tag = 12000 + slotID;
    [sweet setImage:sweetTeture forState:UIControlStateNormal];
    
    if(![mapSweetsEquipped hasSweetEquippedToBuilding:uuidAsLong forBuilding:[mapBuildingUI getCurrentMapBuildingID]]){
        SEL onPress = @selector(onSweetInvPress:);
        
        [sweet addTarget:self action:onPress forControlEvents:UIControlEventTouchUpInside];
    }
    
    [slot addSubview:slotBg];
    [slot addSubview:sweet];
    
    if([mapSweetsEquipped hasSweetEquippedToBuilding:uuidAsLong forBuilding:[mapBuildingUI getCurrentMapBuildingID]]){
        UIImage *inUseImage = [UIImage imageNamed:@"boxInUse"];
        UIImageView *inUseSlot = [[UIImageView alloc] initWithImage:inUseImage];
        
        inUseSlot.frame = CGRectMake(0, 0, slot.frame.size.width, slot.frame.size.height);
        
        [slot addSubview:inUseSlot];
    }
    
    
    
    [v addSubview:slot];
    
    
}
+(CGRect)layoutStyle: (float)slotSquared Padding:(float)padding drawNo:(int)drawID {
    
    float xPos = 0;
    float yPos = 0;
    
    int rowNeeded = (drawID) % 3;
    int drawCol = (((drawID) - rowNeeded + 3)/3) - 1;
    
    
    for(int x = 0; x < 3; x++){
        if(rowNeeded == x){
            xPos = x*slotSquared + padding*x;
        }
    }
    
    yPos = drawCol * slotSquared + padding;
    
    return CGRectMake(xPos, yPos, slotSquared, slotSquared);
}
+(void)onSweetInvPress: (id)sender {
    UIButton *sweet = (UIButton*)sender;
    UIView *slot = [sweet superview];
    UIView *scrollView = [slot superview];
    UIView *machineView = [scrollView superview];
    UIView *main = [machineView superview];
    
    int inventorySlotNumber = (int)sweet.tag - 12000;
    long invSweetUUID = [sweetUUID getUUIDForSweetWithInventoryID:inventorySlotNumber];
    NSLog(@"%ld", invSweetUUID);
    
    [buildingData changeMachineSlotValueFromBuilding:[mapBuildingUI getCurrentMapBuildingID] andMachine:[mapMachineUI getCurrentMapMachineID] forSlot:currentSlot andSweetUUID:invSweetUUID];
    
    [UIView animateWithDuration:0.3 animations:^{
        [machineView setFrame:CGRectMake(main.frame.size.width, machineView.frame.origin.y, machineView.frame.size.width, machineView.frame.size.height)];
    } completion:^(bool finished){
        [machineView removeFromSuperview];
        [mapMachineUI createMachineUi:main machineID:[mapMachineUI getCurrentMapMachineID]];
    }];
    
}
+(void)onClose:(id)sender {
    
    UIButton *cross = (UIButton*)sender;
    UIView *drawView = [cross superview];
    UIView *main = [drawView superview];
    
    [UIView animateWithDuration:0.15 animations:^{
        [drawView setFrame:CGRectMake(drawView.frame.size.width, drawView.frame.origin.y, drawView.frame.size.width, drawView.frame.size.height)];
        [mapMachineUI createMachineUi:main machineID:[mapMachineUI getCurrentMapMachineID]];
    } completion:^(BOOL finished){
        [drawView removeFromSuperview];
    }];
}
@end
