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

@implementation box1

int selectedSweet = 1;
int slotsUnlocked = 2;

+(void)addbox:(SKSpriteNode*)s {
    [self addButtons:s];
    [self addSlots:s];
    [self addSweet:s];
}

+(void)addSlots:(SKSpriteNode*)s {
    float yVal = s.frame.size.height/2.4;
    [slot slot:s slotNumber:1 pos:CGPointMake(-s.frame.size.width/1.35, yVal)];
    [slot slot:s slotNumber:2 pos:CGPointMake(-s.frame.size.width/2.8, yVal)];
    [slot slot:s slotNumber:3 pos:CGPointMake(0, yVal)];
    [slot slot:s slotNumber:4 pos:CGPointMake(s.frame.size.width/2.8, yVal)];
    [slot slot:s slotNumber:5 pos:CGPointMake(s.frame.size.width/1.35, yVal)];
}

+(void)addButtons: (SKSpriteNode*)s {
    [buttonCreator createSweetButton:s text:@"SWEET TYPE" buttonName:@"sweetTypeButton" position:CGPointMake(0, -s.frame.size.height/2.4)];
    [buttonCreator createSweetButton:s text:@"FLAVOUR" buttonName:@"sweetFlavourButton" position:CGPointMake(0, -s.frame.size.height/1.6)];
}

+(void)addSweet: (SKSpriteNode*)s {
    SKSpriteNode *sweet = [SKSpriteNode spriteNodeWithImageNamed:@"defaultSweet"];
    sweet.position = CGPointMake(0, 0);
    [s addChild:sweet];
}
+(void)onSlotClick: (SKSpriteNode*)s {
    if([s.name containsString:@"sweetSlot"]){
        if([s.name containsString:@"1"]){
            selectedSweet = 1;
        }
        if([s.name containsString:@"2"] && (slotsUnlocked > 2)){
            selectedSweet = 2;
        }
        if([s.name containsString:@"3"] && (slotsUnlocked > 3)){
            selectedSweet = 3;
        }
        if([s.name containsString:@"4"] && (slotsUnlocked > 4)){
            selectedSweet = 4;
        }
        if([s.name containsString:@"5"] && (slotsUnlocked > 5)){
            selectedSweet = 5;
        }
    }
}
+(int)getSelectedSlot {
    return selectedSweet;
}
+(int)getSlotsUnlocked {
    return slotsUnlocked;
}
@end
