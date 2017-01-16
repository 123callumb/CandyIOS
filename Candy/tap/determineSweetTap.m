//
//  determineSweetTap.m
//  Candy
//
//  Created by Callum Beckwith on 24/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "determineSweetTap.h"
#import "defaultSweet.h"
#import "nodeToParticle.h"
#import "money.h"
#import "inventory.h"
#import "box1.h"
#import "sweetDrawData.h"
#import "sweetValueCalculation.h"

@implementation determineSweetTap

+(void)spawn: (SKScene *)s location:(CGPoint)p {
    
    
        for(int i = 0; i <= [sweetDrawData getDrawsUnlocked]; i++){
            if([self getInventoryUnlocked] >= i){
                
                //Create sweet with identity of sweets from the sweet draw
                SKSpriteNode *sweet1 = [self createSweetSprite:s pos:p slotNo:i];
                
                //Use node to particle to make it fly out of the machine
                [nodeToParticle particleFlyAnimation:sweet1 scene:s scaleNo:[self determineScale]];
                
                //Add on press of the inventory is worth
                [money addBalance:[sweetValueCalculation calculateSkValue:sweet1]];
                
            }
    }
}
+(float)determineScale {
    if([self getInventoryUnlocked] == 1){
        return 0.7;
    }
    if([self getInventoryUnlocked] == 2){
        return 0.6;
    }
    if([self getInventoryUnlocked] == 3){
        return 0.5;
    }
    if([self getInventoryUnlocked] == 4){
        return 0.4;
    }if([self getInventoryUnlocked] == 5){
        return 0.3;
    }else {
        return 0.2;
    }
}
+(int)getInventoryUnlocked {
    return (int)[sweetDrawData getDrawsUnlocked];
}
+(id)createSweetSprite: (SKScene*)s pos:(CGPoint)p slotNo:(int)slotID {
    NSString *sweetTextureName = [sweetDrawData getTextureAtSlot:slotID];
    SKSpriteNode *sweet = [SKSpriteNode spriteNodeWithImageNamed:sweetTextureName];
    sweet.position = p;
    sweet.zPosition = 1;
    return sweet;
}
@end
