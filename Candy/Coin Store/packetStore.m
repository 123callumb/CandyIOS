//
//  packetStore.m
//  Candy
//
//  Created by Callum Beckwith on 03/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "packetStore.h"
#import "storeItemUI.h"
#import "gems.h"
#import "packetInventoryData.h"

@implementation packetStore
+(NSArray*)packets {
    NSArray *packets = [NSArray arrayWithObjects:@"lollyPacket",
                        @"bonbonPacket",
                        @"sweetPacket",
                        @"chewPacket",
                        @"jawbreakerPacket",nil];
    
    return packets;
}
+(void)addPacketStoreUI: (UIView*)v {
    UIScrollView *packetStore = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
    packetStore.contentSize = CGSizeMake(packetStore.frame.size.width, packetStore.frame.size.height/2 * ([[self packets] count]));
    packetStore.tag = 21300;
    packetStore.backgroundColor = [UIColor whiteColor];
    [self addItemUIs:packetStore];
    
    [v addSubview:packetStore];
}
+(void)addItemUIs: (UIScrollView*)v {
    for(int i = 0; i <= ([[self packets] count] - 1); i++){
        
        [storeItemUI nonOwnedItemUI:v
                             itemID:i
                        shopTexture:@"itemUI_Floor"
                         startTagAt:25000
                        itemTexture:[[self packets] objectAtIndex:i]
                          itemScale:0.3
                           itemName:[self determineScreenName:[[self packets] objectAtIndex:i]]
                          itemPrice:2
         ];
    }
}
+(NSString*)determineScreenName: (NSString*)inputString {
    NSString *output;
    
    if([inputString isEqualToString:@"lollyPacket"]){
        output = @"LOLLYS";
    }else if([inputString isEqualToString:@"bonbonPacket"]){
        output = @"BONBONS";
    }else if([inputString isEqualToString:@"sweetPacket"]){
        output = @"WRAPPED SWEETS";
    }else if([inputString isEqualToString:@"chewPacket"]){
        output = @"CHEWS";
    }else if([inputString isEqualToString:@"jawbreakerPacket"]){
        output = @"JAWBREAKERS";
    }else {
        output = @"No Name";
    }
    
    return output;
}
+(void)onBuy: (int)packetID {
    if(packetID >= 25000 && packetID < 26000){
        int packetNo = packetID - 25000;
        if([gems getGems] >= 2){
            [packetInventoryData addPacketWithStringToInventory:[[self packets] objectAtIndex:packetNo]];
            [gems addGems:-2];
        }
    }
    
}
@end
