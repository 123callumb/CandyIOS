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
#import "doneButton.h"

@implementation registerBoxes
int slotNoPressed = 0;
+(void)registerBoxes:(SKNode *)obj currentScene:(SKScene *)s {
    [self boxPresser:obj currentScene:s slotNo:1];
    [self boxPresser:obj currentScene:s slotNo:2];
    [self boxPresser:obj currentScene:s slotNo:3];
    [self boxPresser:obj currentScene:s slotNo:4];
    [sweetPicker onArrowPress:(SKSpriteNode*)obj scene:s];
    if([obj.name isEqualToString:@"buttonDone"]){
    [doneButton onTouch:obj currentScene:s];
    }
}

+(void)boxPresser:(SKNode *)obj currentScene:(SKScene *)s slotNo:(int)num {
    
    if([obj.name isEqualToString:[NSString stringWithFormat:@"box_1_%d", num]]){
        [box1DataScreen menuActions:s inScene:true];
        [self setSlotPressed:num];
        [self cheekyInteraction:(SKSpriteNode*)obj];
    }
    
}
+(int)getSlotPressed {
    return slotNoPressed;
}
+(void)setSlotPressed: (int)num {
    slotNoPressed = num;
}
+(void)cheekyInteraction: (SKSpriteNode*)s {
    SKAction *shrink = [SKAction scaleBy:0.8 duration:0.1];
    SKAction *grow = [SKAction scaleBy:1.25 duration:0.1];
    [s runAction:shrink completion:^{
        [s runAction:grow];
    }];
}


@end
