//
//  candyMachineSweetSelector.m
//  Candy
//
//  Created by Callum Beckwith on 06/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "candyMachineSweetSelector.h"
#import "sweetInventoryData.h"
#import "sweetInventorySlot.h"
#import "candyMachineSweetsEquiped.h"
#import "candyMachineSweetSelector.h"
#import "sweetUUID.h"
#import "candyMachineUI.h"
#import "candyMachineSlotData.h"
#import "candyMachineInteraction.h"

@implementation candyMachineSweetSelector
+(void)createInvSelectionUI: (UIView*)v {
    float uiWidth = v.frame.size.width/1.5;
    float uiHeight = v.frame.size.height/1.74;
    
    UIScrollView *drawSlotsUi = [[UIScrollView alloc] initWithFrame:CGRectMake(v.frame.size.width/2 - uiWidth/2, v.frame.size.height/5.4, uiWidth, uiHeight)];
    drawSlotsUi.backgroundColor = [UIColor clearColor];
    
    
    if([[sweetInventoryData getInventory] count] >= 1 && [sweetInventoryData getInventory] != nil){
        drawSlotsUi.contentSize = CGSizeMake(drawSlotsUi.frame.size.width, (drawSlotsUi.frame.size.width/2)*(([[sweetInventoryData getInventory] count]+1)/2));
        for(int i = 0; i <= [[sweetInventoryData getInventory] count] - 1; i++){
            [self createSlot:drawSlotsUi slotNo:i];
        }
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
    
    UIView *slot = [[UIView alloc] initWithFrame:[self layoutStyle:v.frame.size.width/2.2 Padding:v.frame.size.width/40 drawNo:slotID]];
    
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
    
    if(![[candyMachineSweetsEquiped equippedSweets] containsObject:sweetUUID]){
        SEL onPress = @selector(onSweetInvPress:);
        
        [sweet addTarget:self action:onPress forControlEvents:UIControlEventTouchUpInside];
    }
    
    [slot addSubview:slotBg];
    [slot addSubview:sweet];
    
    if([[candyMachineSweetsEquiped equippedSweets] containsObject:sweetUUID]){
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
    
    int rowNo = 0;
    
    for(int i = 1; i <= [[sweetInventoryData getInventory] count] - 1; i = i + 2){
        if (drawID == i) {
            xPos = (slotSquared*2.2) - slotSquared;
        }
    }
    for(int i = 0; i <= [[sweetInventoryData getInventory] count] - 1; i = i + 2){
        if(drawID == i || drawID == i + 1){
            yPos = ((slotSquared + padding) * rowNo) + padding;
        }else {
            rowNo++;
        }
    }
    return CGRectMake(xPos, yPos, slotSquared, slotSquared);
}
+(void)onSweetInvPress: (id)sender {
    UIButton *sweet = (UIButton*)sender;
    UIView *v1 = [sweet superview];
    UIView *v = [v1 superview];
    int slotNumber = (int)sweet.tag - 12000;
    long uUID = [sweetUUID getInventoryIdForSweetWithUUID:slotNumber];
    
    NSMutableDictionary *slotData = [sweetInventoryData getSweetDataAtSlot:slotNumber];
    NSString *textureName = [slotData objectForKey:@"sweet_texture"];
    
    [candyMachineSlotData changeMachineSlotDataAtID:[candyMachineInteraction getCurrentSelectedMachine] slotID:[candyMachineUI getSelectedSlot] sweetTexture:textureName];
    [candyMachineSweetsEquiped equipSweet:[NSNumber numberWithLong:uUID]];
    [candyMachineUI resetSelectedSlot];
    [candyMachineInteraction resetCurrentSelectedMachine];
    [v removeFromSuperview];
}
@end
