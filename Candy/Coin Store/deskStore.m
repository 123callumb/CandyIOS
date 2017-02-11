//
//  deskStore.m
//  Candy
//
//  Created by Callum Beckwith on 08/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "deskStore.h"
#import "storeItemUI.h"
#import "desks.h"
#import "money.h"
#import "messageUI.h"

@implementation deskStore

+(void)addDeskStoreUI: (UIView*)v {
    UIScrollView *deskStore = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
    deskStore.contentSize = CGSizeMake(deskStore.frame.size.width, deskStore.frame.size.height/2 * ([desks getAmountOfDesks] + 1));
    deskStore.tag = 21100;
    deskStore.backgroundColor = [UIColor whiteColor];
    [self addItemUIs:deskStore];
    
    [v addSubview:deskStore];
}
+(void)addItemUIs: (UIScrollView*)v {
    for(int i = 0; i <= [desks getAmountOfDesks]; i++){
        [storeItemUI
         createItemUI:v
         itemID:i
         shopTexture:@"itemUI_Floor"
         startTagAt:23000
         itemTexture:[desks getDeskAtIndex:i]
         itemScale:0.4
         itemName:[self determineScreenName:[desks getDeskAtIndex:i]]
         itemPrice:[self determinePriceBasedOnName:[desks getDeskAtIndex:i]]
         owned:[desks doesOwnDesk:i]
         ];
    }
}
+(NSString*)determineScreenName: (NSString*)inputString {
    NSString *output;
    
    if([inputString isEqualToString:@"desk_wood"]){
        output = @"WOODEN DESK";
    }else if([inputString isEqualToString:@"desk_grey"]){
        output = @"GREY DESK";
    }else if([inputString isEqualToString:@"desk_polished"]){
        output = @"POLISHED DESK";
    }else if([inputString isEqualToString:@"black_desk"]){
        output = @"METAL DESK";
    }else if([inputString isEqualToString:@"desk_king"]){
        output = @"RICH OAK";
    }else {
        output = @"No Name";
    }
    
    return output;
}
+(int)determinePriceBasedOnName: (NSString*)inputString {
    int output;
    
    if([inputString isEqualToString:@"desk_wood"]){
        output = 0;
    }else if([inputString isEqualToString:@"desk_grey"]){
        output = 2500;
    }else if([inputString isEqualToString:@"desk_polished"]){
        output = 5000;
    }else if([inputString isEqualToString:@"black_desk"]){
        output = 7500;
    }else if([inputString isEqualToString:@"desk_king"]){
        output = 50000;
    }else {
        output = 0;
    }
    
    return output;
}
+(void)onBuy: (int)deskID view:(UIView*)v {
    if(deskID >= 23000 && deskID < 24000){
        int desk = deskID - 23000;
        if([money getBalance] >= [self determinePriceBasedOnName:[desks getDeskAtIndex:desk]]){
            
            [desks addNewDeskToList:desk];
            [desks setCurrentDeskID:desk];
            [money addBalance:-[self determinePriceBasedOnName:[desks getDeskAtIndex:desk]]];
            
            UIView *v1 = [v superview];
            UIView *v2 = [v1 superview];
            [v removeFromSuperview];
            [self addDeskStoreUI:v2];
        }else {
            [messageUI createMessageBox:[[[v superview] superview] superview] information:@"You don't have enough moeny for this :(" representingImage:@"coin" imageScale:1 messageBoxID:42 displayOnce:false];
        }
    }
    
}
+(void)onEquip: (int)deskID view:(UIView*)v {
    if(deskID >= 23000 && deskID < 24000){
        int desk = deskID - 23000;
        [desks setCurrentDeskID:desk];
    
    }
}
@end
