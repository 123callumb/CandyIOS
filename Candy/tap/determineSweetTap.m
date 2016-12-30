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
    
    if (p.y >= -470){
    
    p = CGPointMake(-40, -80);
    float scale = 0.3;
    
        for(int i = 1; i <= [sweetDrawData getDrawsUnlocked]; i++){
            if([self getInventoryUnlocked] >= i){
                SKSpriteNode *sweet1 = [self createSweetSprite:s pos:p slotNo:i];
                [nodeToParticle particleFlyAnimation:sweet1 scene:s scaleNo:scale];
                [money addBalance:[sweetValueCalculation calculateSkValue:sweet1]];
            }
        }
    }
}
+(float)determineScale {
    if([self getInventoryUnlocked] == 1){
        return 0.3;
    }
    if([self getInventoryUnlocked] == 2){
        return 0.3;
    }
    if([self getInventoryUnlocked] == 3){
        return 0.3;
    }
    if([self getInventoryUnlocked] == 4){
        return 0.3;
    }if([self getInventoryUnlocked] == 5){
        return 0.3;
    }else {
        return 0.005;
    }
}
+(int)getInventoryUnlocked {
    return (int)[sweetDrawData getDrawsUnlocked];
}
+(id)createSweetSprite: (SKScene*)s pos:(CGPoint)p slotNo:(int)slotID {
    NSString *sweetTextureName = [sweetDrawData getTextureAtSlot:slotID];
    SKSpriteNode *sweet = [SKSpriteNode spriteNodeWithImageNamed:sweetTextureName];
    sweet.position = p;

    return sweet;
}
@end
