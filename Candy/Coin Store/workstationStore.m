//
//  workstationStore.m
//  Candy
//
//  Created by Callum Beckwith on 08/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "workstationStore.h"
#import "levelWorkstations.h"
#import "storeItemUI.h"
#import "money.h"

@implementation workstationStore

+(void)addWorkstationStoreUI: (UIView*)v {
    UIScrollView *workstationStore = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
    workstationStore.contentSize = CGSizeMake(workstationStore.frame.size.width, workstationStore.frame.size.height/2 * ([levelWorkstations getAmountOfWorkstations] + 1));
    workstationStore.tag = 21200;
    workstationStore.backgroundColor = [UIColor whiteColor];
    [self addItemUIs:workstationStore];
    
    [v addSubview:workstationStore];
}
+(void)addItemUIs: (UIScrollView*)v {
    for(int i = 0; i <= [levelWorkstations getAmountOfWorkstations]; i++){
        [storeItemUI
         createItemUI:v
         itemID:i
         shopTexture:@"itemUI_Floor"
         startTagAt:24000
         itemTexture:[levelWorkstations getWorkstationAtIndex:i]
         itemScale:0.6
         itemName:[self determineScreenName:[levelWorkstations getWorkstationAtIndex:i]]
         itemPrice:[self determinePriceBasedOnName:[levelWorkstations getWorkstationAtIndex:i]]
         owned:[levelWorkstations doesOwnWorkstation:i]
         ];
    }
}
+(NSString*)determineScreenName: (NSString*)inputString {
    NSString *output;
    
    if([inputString isEqualToString:@"workstation_box"]){
        output = @"BOX";
    }else if([inputString isEqualToString:@"workstation_wood"]){
        output = @"OAK STATION";
    }else if([inputString isEqualToString:@"workstation_cloudedGlass"]){
        output = @"CLOUDED GLASS";
    }else if([inputString isEqualToString:@"workstation_grey"]){
        output = @"GREY STATION";
    }else if([inputString isEqualToString:@"workstation_colours"]){
        output = @"COLOURED GLASS";
    }else if([inputString isEqualToString:@"workstation_tetris"]){
        output = @"TETRIS STATION";
    }else if([inputString isEqualToString:@"workstation_meme"]){
        output = @"HARAMBE <3";
    }else {
        output = @"No Name";
    }
    
    return output;
}
+(int)determinePriceBasedOnName: (NSString*)inputString {
    int output;
    
    if([inputString isEqualToString:@"workstation_box"]){
        output = 0;
    }else if([inputString isEqualToString:@"workstation_wood"]){
        output = 3000;
    }else if([inputString isEqualToString:@"workstation_cloudedGlass"]){
        output = 4000;
    }else if([inputString isEqualToString:@"workstation_grey"]){
        output = 5000;
    }else if([inputString isEqualToString:@"workstation_colours"]){
        output = 7500;
    }else if([inputString isEqualToString:@"workstation_tetris"]){
        output = 100000;
    }else if([inputString isEqualToString:@"workstation_meme"]){
        output = 100000;
    }else {
        output = 0;
    }
    
    return output;
}
+(void)onBuy: (int)stationID {
    if(stationID >= 24000 && stationID < 25000){
        int workstation = stationID - 24000;
        if([money getBalance] >= [self determinePriceBasedOnName:[levelWorkstations getWorkstationAtIndex:workstation]]){
            [levelWorkstations addNewWorkstationToList:workstation];
            [levelWorkstations setCurrentWorkstationID:workstation];
            [money addBalance:-[self determinePriceBasedOnName:[levelWorkstations getWorkstationAtIndex:workstation]]];
        }
    }
    
}
+(void)onEquip: (int)stationID {
    if(stationID >= 24000 && stationID < 25000){
        int workstation = stationID - 24000;
        [levelWorkstations setCurrentWorkstationID:workstation];
    }
}

@end
