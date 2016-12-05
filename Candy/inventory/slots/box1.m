//
//  box1.m
//  Candy
//
//  Created by Callum Beckwith on 19/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "box1.h"
#import "slot.h"
#import "sweetData.h"
#import "flavourPicker.h"
#import "slot1Data.h"
#import "buttonCreator.h"
#import "sweetPicker.h"

@implementation box1

int selectedSweet = 1;
int slotsUnlocked = 4;

+(void)addbox:(SKSpriteNode*)s {
    [buttonCreator addButtons:s];
    [self addSlots:s];
    [sweetPicker addSweet:s];
}

+(void)addSlots:(SKSpriteNode*)s {
    for(int i = 1; i <= 5; i++){
        [slot slot:s slotNumber:i];
    }
}

+(void)onSlotClick: (SKSpriteNode*)s scene:(SKScene*)sk{
    if([s.name containsString:@"sweetSlot"]){
            for(int i = 1; i <= 5; i++){
                [self slotClickMethod:i slot:s scene:sk];
            }
    }
}
+(void)slotClickMethod:(int)slotNo slot:(SKSpriteNode*)s scene:(SKScene*)sk {
    SKSpriteNode *invNode = (SKSpriteNode*)[sk childNodeWithName:@"menuInventory"];
    if([s.name containsString:[NSString stringWithFormat:@"%d", slotNo]] && (slotNo <= slotsUnlocked)){
        selectedSweet = slotNo;
        [slot refreshSlots:invNode];
        [sweetPicker refreshSweetType:invNode];
        [buttonCreator refreshButtons:invNode];
    }
}
+(int)getSelectedSlot {
    return selectedSweet;
}
+(int)getSlotsUnlocked {
    return slotsUnlocked;
}
@end
