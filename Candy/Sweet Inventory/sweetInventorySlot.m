//
//  sweetInventorySlot.m
//  Candy
//
//  Created by Callum Beckwith on 21/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetInventorySlot.h"
#import "sweetInventoryData.h"

@implementation sweetInventorySlot
+(void)addSlots: (UIScrollView*)v {
    int slotAmount = (int)[[sweetInventoryData getInventory] count]-1;
    
    for(int i = 0; i <= slotAmount; i++){
        [self createSlot:v slotID:i];
    }
}
+(void)createSlot: (UIScrollView*)v slotID:(int)slotNo {
    
    NSMutableDictionary *slotData = [sweetInventoryData getSweetDataAtSlot:slotNo];
    NSString *textureName = [slotData objectForKey:@"sweet_texture"];
    NSString *colourRarity = [slotData objectForKey:@"sweet_color"];
    NSString *slotBackgroundName = [self getSlotBackgroundImage:colourRarity];
    
    UIView *slot = [[UIView alloc] initWithFrame:CGRectMake([self getSlotX:slotNo slotWidth:v.frame.size.width/3.8],
                                                            [self getSlotY:slotNo slotHeight:v.frame.size.width/3.68],
                                                            v.frame.size.height/4, v.frame.size.height/4)];
    
    UIButton *sweet = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *slotBgImage = [UIImage imageNamed:slotBackgroundName];
    UIImageView *slotBg = [[UIImageView alloc] initWithImage:slotBgImage];
    UIImage *sweetTeture = [UIImage imageNamed:textureName];
    
    float sweetWidth = slot.frame.size.width/1.5;
    float sweetHeight = slot.frame.size.height/1.5;
    
    slotBg.frame = CGRectMake(0, 0, slot.frame.size.width, slot.frame.size.height);
    sweet.frame = CGRectMake(slot.frame.size.width/2 - sweetWidth/2, slot.frame.size.height/2 - sweetHeight/2, sweetWidth, sweetHeight);
    
    [sweet setImage:sweetTeture forState:UIControlStateNormal];
    
    [slot addSubview:slotBg];
    [slot addSubview:sweet];
    
    [v addSubview:slot];
    
}

+(NSString*)getSlotBackgroundImage: (NSString*)t {
    if([t isEqualToString:@"Grey"]){
        return @"greySlotBg";
    }
    if([t isEqualToString:@"Blue"]){
        return @"blueSlotBg";
    }
    if([t isEqualToString:@"Red"]){
        return @"redSlotBg";
    }
    if([t isEqualToString:@"Yellow"]){
        return @"yellowSlotBg";
    }else return @"greySlotBg";
}
+(float)getSlotY: (int)slotNo slotHeight:(float)slotH {
    
    for(int i = 0; i <= slotNo; i = i + 4){
        if(slotNo == i){
            return 0;
            }
        }
    for(int i = 1; i <= slotNo; i = i + 4){
        if(slotNo == i){
                return slotH;
        }
    }
    for(int i = 2; i <= slotNo; i = i + 4){
        if(slotNo == i){
                return slotH*2;
        }
    }
    for(int i = 3; i <= slotNo; i = i + 4){
        if(slotNo == i){
                return slotH*3;
        }
    }

    return 0;
}
+(float)getSlotX: (int)slotNo slotWidth:(float)slotW {
    
    int row = 0;
    int slot = slotNo;
    
    for(int i = slotNo; i <= [[sweetInventoryData getInventory] count]-1; i = i - 4){
        
        if(slot == 0 || slot == 1 || slot == 2 || slot == 3){
            return slotW*row;
        }else {
            row = row+1;
            slot = slot -4;
           
        }
    }
    
    return 0;
}
@end
