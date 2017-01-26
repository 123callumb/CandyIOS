//
//  drawInventorySelector.m
//  Candy
//
//  Created by Callum Beckwith on 28/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "drawInventorySelector.h"
#import "sweetInventoryData.h"
#import "sweetInventorySlot.h"
#import "sweetDrawData.h"
#import "sweetDrawUI.h"

@implementation drawInventorySelector

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
    NSString *slotBackgroundName = [sweetInventorySlot getSlotBackgroundImage:colourRarity];
    
    UIView *slot = [[UIView alloc] initWithFrame:[self layoutStyle:v.frame.size.width/2.2 Padding:v.frame.size.width/40 drawNo:slotID]];
    
    UIButton *sweet = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *slotBgImage = [UIImage imageNamed:slotBackgroundName];
    UIImageView *slotBg = [[UIImageView alloc] initWithImage:slotBgImage];
    UIImage *sweetTeture = [UIImage imageNamed:textureName];
    
    NSNumber *slotNo = [NSNumber numberWithInteger:slotID];
    
    float sweetWidth = slot.frame.size.width/1.5;
    float sweetHeight = slot.frame.size.height/1.5;
    
    slotBg.frame = CGRectMake(0, 0, slot.frame.size.width, slot.frame.size.height);
    sweet.frame = CGRectMake(slot.frame.size.width/2 - sweetWidth/2, slot.frame.size.height/2 - sweetHeight/2, sweetWidth, sweetHeight);
    
    sweet.tag = 12000 + slotID;
    [sweet setImage:sweetTeture forState:UIControlStateNormal];
    
    if(![[sweetDrawData getDraw] containsObject:slotNo]){
    SEL onPress = @selector(onSweetInvPress:);
    
    [sweet addTarget:self action:onPress forControlEvents:UIControlEventTouchUpInside];
    }
    
    [slot addSubview:slotBg];
    [slot addSubview:sweet];
    
    if([[sweetDrawData getDraw] containsObject:slotNo]){
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
    UIButton *sweetSelected = (UIButton*)sender;
    UIView *slot = [sweetSelected superview];
    UIScrollView *sv = (UIScrollView*)[slot superview];
    UIView *v = [sv superview];
    UIView *v1 = [v superview];
    
    int invSlotNo = (int) (sweetSelected.tag) - 12000;
    //NSLog(@"%d", invSlotNo);
   
    [sweetDrawData editObject:[sweetDrawData getDrawSelected] invSlot:invSlotNo];
    
    //NSMutableDictionary *addedobj = [sweetDrawData getSweetDataAtSlot:[sweetDrawData getDrawSelected]];
    //NSString *tex = [addedobj objectForKey:@"sweet_texture"];
    //NSLog(@"slot %d was set to texture %@", [sweetDrawData getDrawSelected], tex);
    
    [sweetDrawUI refresh:v1];
    [v removeFromSuperview];

}

@end
