//
//  floorStore.m
//  Candy
//
//  Created by Callum Beckwith on 07/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "floorStore.h"
#import "storeItemUI.h"
#import "floors.h"
#import "money.h"
#import "coinStoreUI.h"
#import "messageUI.h"

@implementation floorStore
+(void)addFloorStoreUI: (UIView*)v {
    UIScrollView *floorStore = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
    floorStore.contentSize = CGSizeMake(floorStore.frame.size.width, floorStore.frame.size.height/2 * ([floors getAmountOfFloors] + 1));
    floorStore.tag = 21000;
    floorStore.backgroundColor = [UIColor whiteColor];
    [self addItemUIs:floorStore];
    [v addSubview:floorStore];
}
+(void)addItemUIs: (UIScrollView*)v {
    for(int i = 0; i <= [floors getAmountOfFloors]; i++){
        [storeItemUI
         createItemUI:v
         itemID:i
         shopTexture:@"itemUI_Floor"
         startTagAt:22000
         itemTexture:[floors getFloorAtIndex:i]
         itemScale:0.2
         itemName:[self determineScreenName:[floors getFloorAtIndex:i]]
         itemPrice:[self determinePriceBasedOnName:[floors getFloorAtIndex:i]]
         owned:[floors doesOwnFloor:i]
         ];
    }
}
+(NSString*)determineScreenName: (NSString*)inputString {
    NSString *output;
    
    if([inputString isEqualToString:@"floor_1"]){
        output = @"GREY FLOOR";
    }else if([inputString isEqualToString:@"floor_blue"]){
        output = @"BLUE FLOOR";
    }else if([inputString isEqualToString:@"floor_red"]){
        output = @"RED FLOOR";
    }else if([inputString isEqualToString:@"floor_yellow"]){
        output = @"YELLOW FLOOR";
    }else if([inputString isEqualToString:@"floor_green"]){
        output = @"GREEN FLOOR";
    }else if([inputString isEqualToString:@"floor_wood"]){
        output = @"WOODEN FLOOR";
    }else if([inputString isEqualToString:@"floor_disco"]){
        output = @"DISCO FLOOR";
    }else {
        output = @"No Name";
    }
    
    return output;
}
+(int)determinePriceBasedOnName: (NSString*)inputString {
    int output;
    
    if([inputString isEqualToString:@"floor_1"]){
        output = 0;
    }else if([inputString isEqualToString:@"floor_blue"]){
        output = 1000;
    }else if([inputString isEqualToString:@"floor_red"]){
        output = 1000;
    }else if([inputString isEqualToString:@"floor_yellow"]){
        output = 1000;
    }else if([inputString isEqualToString:@"floor_green"]){
        output = 1000;
    }else if([inputString isEqualToString:@"floor_wood"]){
        output = 7500;
    }else if([inputString isEqualToString:@"floor_disco"]){
        output = 25000;
    }else {
        output = 0;
    }
    
    return output;
}
+(void)onBuy: (int)floorID view:(UIView*)v {
    if(floorID >= 22000 && floorID < 23000){
        int floor = floorID - 22000;
        if([money getBalance] >= [self determinePriceBasedOnName:[floors getFloorAtIndex:floor]]){
            [floors addNewFloorToList:floor];
            [floors setCurrentFloorID:floor];
            [money addBalance:-[self determinePriceBasedOnName:[floors getFloorAtIndex:floor]]];
            UIView *v1 = [v superview];
            UIView *v2 = [v1 superview];
            [v removeFromSuperview];
            [self addFloorStoreUI:v2];
        }else {
            [messageUI createMessageBox:[[[v superview] superview] superview] information:@"You don't have enough moeny for this :(" representingImage:@"coin" imageScale:1 messageBoxID:42 displayOnce:false];
        }
    }
                                  
}
+(void)onEquip: (int)floorID view:(UIView*)v {
    if(floorID >= 22000 && floorID < 23000){
        int floor = floorID - 22000;
        [floors setCurrentFloorID:floor];
    }
}
@end
