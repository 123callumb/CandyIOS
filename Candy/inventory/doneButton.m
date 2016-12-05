//
//  doneButton.m
//  Candy
//
//  Created by Callum Beckwith on 21/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "doneButton.h"
#import "buttonAnimation.h"
#import "sweetCustomMenu.h"
#import "inventoryMenu.h"
#import "sweetPicker.h"
#import "box1.h"
#import "slot1Data.h"
#import "registerBoxes.h"
#import "flavourPicker.h"

@implementation doneButton
+(void)createButton: (SKSpriteNode*)s {
    SKSpriteNode *buttonDone = [SKSpriteNode spriteNodeWithImageNamed:@"doneButton"];
    buttonDone.anchorPoint = CGPointMake(0.5, 0.5);
    buttonDone.position = CGPointMake(0, 0);
    buttonDone.position =CGPointMake(0, s.frame.size.height/5);
    buttonDone.zPosition = 15;
    buttonDone.name = @"buttonDone";
    [s addChild:buttonDone];
}
+(void)onTouch: (SKNode*)n currentScene:(SKScene*)s {
    [buttonAnimation changeState:n changeName:@"donePressured" originalName:@"doneButton"];
    [sweetCustomMenu menuActions:s inScene:false];
    int slotClicked = [registerBoxes getSlotPressed];
    [self getSweetPickerData:slotClicked];
    [registerBoxes setSlotPressed:0];
}
+(void)getSweetPickerData:(int)slotClicked {
}
@end
