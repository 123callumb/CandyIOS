//
//  sweetData.m
//  Candy
//
//  Created by Callum Beckwith on 20/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetData.h"
#import "slot1Data.h"

@implementation sweetData
+(id)sweetFromSlot: (int)i {
    SKSpriteNode *sweet = [SKSpriteNode spriteNodeWithImageNamed:[self textureDecider:i]];
    return sweet;
}
+(NSString*)textureDecider: (int)i {
    if([slot1Data getSweet:i] == 0){
        return @"defaultSweet";
    }
    if([slot1Data getSweet:i] == 1){
        return @"bonbon";
    }
    if([slot1Data getSweet:i] == 2){
        return @"badSweet";
    }
    else {
    return @"";
    }
}
+(NSString*)sweetTypeNameDecider: (int)i {
    if([slot1Data getSweet:i] == 0){
        return @"WRAPPED SWEET";
    }
    if([slot1Data getSweet:i] == 1){
        return @"BON BON";
    }
    if([slot1Data getSweet:i] == 2){
        return @"CHEW";
    }
    else {
        return @"SWEET TYPE";
    }
}
+(NSString*)determineFlavourString: (int)flavourID {
    if([slot1Data getFlavour:flavourID] == 1){
        return @"MINT";
    }
    if([slot1Data getFlavour:flavourID] == 2){
        return @"COKE";
    }
    if([slot1Data getFlavour:flavourID] == 3){
        return @"StRAWBERRY";
    }
    if ([slot1Data getFlavour:flavourID] == 4) {
        return @"CHOCOLATE";
    }else {
        return @"FLAVOUR";
    }
}
@end
