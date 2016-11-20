//
//  registerBoxes.m
//  Candy
//
//  Created by Callum Beckwith on 20/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "registerBoxes.h"
#import "box1DataScreen.h"
#import "sweetPicker.h"

@implementation registerBoxes
int slotNoPressed = 0;
+(void)registerBoxes:(SKNode *)obj currentScene:(SKScene *)s {
    [self boxPresser:obj currentScene:s slotNo:1];
    [self boxPresser:obj currentScene:s slotNo:2];
    [self boxPresser:obj currentScene:s slotNo:3];
    [self boxPresser:obj currentScene:s slotNo:4];
    [sweetPicker onArrowPress:(SKSpriteNode*)obj scene:s];
}

+(void)boxPresser:(SKNode *)obj currentScene:(SKScene *)s slotNo:(int)num {
    
    if([obj.name isEqualToString:[NSString stringWithFormat:@"box_1_%d", num]]){
        [box1DataScreen menuActions:s inScene:true];
        [self setSlotPressed:num];
    }
    
}
+(int)getSlotPressed {
    return slotNoPressed;
}
+(void)setSlotPressed: (int)num {
    slotNoPressed = num;
}


@end
