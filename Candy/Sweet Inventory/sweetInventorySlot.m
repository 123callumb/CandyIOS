//
//  sweetInventorySlot.m
//  Candy
//
//  Created by Callum Beckwith on 21/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetInventorySlot.h"
#import "sweetInventoryData.h"
#import "itemUI.h"
#import "sweetValueCalculation.h"

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
    UIImage *ptTeture = [UIImage imageNamed:@"ptLabel"];
    UIImageView *ptBg = [[UIImageView alloc] initWithImage:ptTeture];

    
    float sweetWidth = slot.frame.size.width/1.5;
    float sweetHeight = slot.frame.size.height/1.5;
    
    slotBg.frame = CGRectMake(0, 0, slot.frame.size.width, slot.frame.size.height);
    ptBg.frame = CGRectMake(0, 0, slot.frame.size.width, slot.frame.size.height);
    sweet.frame = CGRectMake(slot.frame.size.width/2 - sweetWidth/2, slot.frame.size.height/2 - sweetHeight/1.4, sweetWidth, sweetHeight);
    
    UILabel *perTapValue = [[UILabel alloc] initWithFrame:CGRectMake(0, slot.frame.size.height/4.5, slot.frame.size.width, ptBg.frame.size
                                                                     .height)];
    sweet.tag = 4500 + slotNo;
    [sweet setImage:sweetTeture forState:UIControlStateNormal];
    
    [perTapValue setFont:[UIFont fontWithName:@"Coder's-Crux" size:20]];
    [perTapValue setText:[NSString stringWithFormat:@"%dPT", [sweetValueCalculation calculateTextureValue:textureName]]];
    [perTapValue setTextColor:[UIColor blackColor]];
    [perTapValue setTextAlignment:NSTextAlignmentCenter];
    
    SEL onPress = @selector(onSweetPress:);
    
    [sweet addTarget:self action:onPress forControlEvents:UIControlEventTouchUpInside];
    
    [slot addSubview:slotBg];
    [slot addSubview:sweet];
    [ptBg addSubview:perTapValue];
    [slot addSubview:ptBg];
    
    [v addSubview:slot];
    
}

+(void)onSweetPress: (id)sender {
    UIButton *sweet = (UIButton*)sender;
    UIView *ui = [sweet superview];
    UIScrollView *v1 = (UIScrollView*)[ui superview];
    UIView *v = [v1 superview];
    
    int slotNumber = (int) (sweet.tag - 4500);
    [itemUI createNewItemUi:v slotId:slotNumber];

}

+(NSString*)getSlotBackgroundImage: (NSString*)t {
    if([t isEqualToString:@"Grey"]){
        return @"greyBox";
    }
    if([t isEqualToString:@"Blue"]){
        return @"blueBox";
    }
    if([t isEqualToString:@"Red"]){
        return @"redBox";
    }
    if([t isEqualToString:@"Yellow"]){
        return @"yellowBox";
    }else return @"greyBox";
}

+(float)getSlotY: (int)slotNo slotHeight:(float)slotH {
    float ss = 0;
    for(int i = 0; i <= slotNo; i = i + 4){
        if(slotNo == i){
            return 0 + ss;
            }
        }
    for(int i = 1; i <= slotNo; i = i + 4){
        if(slotNo == i){
                return slotH + ss;
        }
    }
    for(int i = 2; i <= slotNo; i = i + 4){
        if(slotNo == i){
                return slotH*2 + ss;
        }
    }
    for(int i = 3; i <= slotNo; i = i + 4){
        if(slotNo == i){
                return slotH*3 + ss;
        }
    }

    return 0;
}
+(float)getSlotX: (int)slotNo slotWidth:(float)slotW {
    
    int row = 0;
    int slot = slotNo;
    float ss = slotW/16;

    
    for(int i = slotNo; i <= [[sweetInventoryData getInventory] count]-1; i = i - 4){
        
        if(slot == 0 || slot == 1 || slot == 2 || slot == 3){
            return slotW*row + ss;
        }else {
            row = row+1;
            slot = slot -4;
           
        }
    }
    
    return 0;
}
@end
