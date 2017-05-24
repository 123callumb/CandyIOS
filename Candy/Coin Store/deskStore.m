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
#import "objectivesBronze.h"

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
    }else if([inputString isEqualToString:@"desk_dj"]){
        output = @"DJ DESK";
    }else if([inputString isEqualToString:@"desk_domino"]){
        output = @"DOMINO DESK";
    }else if([inputString isEqualToString:@"desk_invader"]){
        output = @"INVADER DESK";
    }else if([inputString isEqualToString:@"desk_legged"]){
        output = @"LEGGED DESK";
    }else if([inputString isEqualToString:@"desk_people"]){
        output = @"WOODEN HOLDER";
    }else if([inputString isEqualToString:@"desk_pipework"]){
        output = @"PIPEWORK DESK";
    }else if([inputString isEqualToString:@"desk_speaker"]){
        output = @"SPEAKER DESK";
    }else if([inputString isEqualToString:@"desk_stacled"]){
        output = @"STACKED DESK";
    }else if([inputString isEqualToString:@"desk_tank"]){
        output = @"FISH TANK";
    }else if([inputString isEqualToString:@"desk_tesla"]){
        output = @"MODERN DESK";
    }else if([inputString isEqualToString:@"desk_tetris"]){
        output = @"RETRO DESK";
    }else if([inputString isEqualToString:@"desk_tree"]){
        output = @"BRANCHING DESK";
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
    }else if([inputString isEqualToString:@"desk_dj"]){
        output = 50000;
    }else if([inputString isEqualToString:@"desk_domino"]){
        output = 40000;
    }else if([inputString isEqualToString:@"desk_invader"]){
        output = 30000;
    }else if([inputString isEqualToString:@"desk_legged"]){
        output = 10000;
    }else if([inputString isEqualToString:@"desk_people"]){
        output = 30000;
    }else if([inputString isEqualToString:@"desk_pipework"]){
        output = 25000;
    }else if([inputString isEqualToString:@"desk_speaker"]){
        output = 45000;
    }else if([inputString isEqualToString:@"desk_stacled"]){
        output = 10000;
    }else if([inputString isEqualToString:@"desk_tank"]){
        output = 65000;
    }else if([inputString isEqualToString:@"desk_tesla"]){
        output = 75000;
    }else if([inputString isEqualToString:@"desk_tetris"]){
        output = 100000;
    }else if([inputString isEqualToString:@"desk_tree"]){
        output = 30000;
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
            
            [objectivesBronze object2:[v2 superview]];
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
