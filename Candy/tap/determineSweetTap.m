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

@implementation determineSweetTap

+(void)spawn: (SKScene *)s location:(CGPoint)p {
    
    if (p.y >= -470){
    
    p = CGPointMake(-40, -80);
    float scale = 0.3;
    
        for(int i = 1; i <= [box1 getSlotsUnlocked]; i++){
            if([self getInventoryUnlocked] >= i){
                SKSpriteNode *sweet1 = [defaultSweet addSweet:s pos:p slotID:i];
                [nodeToParticle particleFlyAnimation:sweet1 scene:s scaleNo:scale];
                [money addBalance:[inventory slotCalculation:i]];
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
    }if([self getInventoryUnlocked] == 4){
        return 0.3;
    }else {
        return 0.005;
    }
}
+(int)getInventoryUnlocked {
    return (int)[box1 getSlotsUnlocked];
}
@end
