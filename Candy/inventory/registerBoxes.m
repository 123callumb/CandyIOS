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
#import "flavourPicker.h"
#import "buttonCreator.h"
#import "box1.h"

@implementation registerBoxes
int slotNoPressed = 0;
+(void)registerBoxes:(SKNode *)obj currentScene:(SKScene *)s {
    [buttonCreator animateOnPress:(SKSpriteNode*)obj scene:s];
    [box1 onSlotClick:(SKSpriteNode*)obj scene:s];
    if([obj.name isEqualToString:@"buttonDone"]){
    [doneButton onTouch:obj currentScene:s];
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
