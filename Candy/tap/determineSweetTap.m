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
int inventoryUnlocked = 1;
+(void)spawn: (SKScene *)s location:(CGPoint)p {
    
    inventoryUnlocked = [box1 getSlotsUnlocked];
    
    if (p.y >= -470){
    
    p = CGPointMake(-40, -80);
    SKSpriteNode *sweet = [defaultSweet addSweet:s pos:p slotID:1];
    float scale = [self determineScale];
    [money addBalance:[inventory slotCalculation:1]];
    //NSLog(@"Slot 1 Earnings = %d", [inventory slotCalculation:1]);
    
    [nodeToParticle particleFlyAnimation:sweet scene:s scaleNo:scale];
    
    if(inventoryUnlocked >= 2){
        SKSpriteNode *sweet1 = [defaultSweet addSweet:s pos:p slotID:2];
        [nodeToParticle particleFlyAnimation:sweet1 scene:s scaleNo:scale];
        [money addBalance:[inventory slotCalculation:2]];
        //NSLog(@"Slot 2 Earnings = %d", [inventory slotCalculation:2]);
        
    }
    if(inventoryUnlocked >= 3){
        SKSpriteNode *sweet2 = [defaultSweet addSweet:s pos:p slotID:3];
        [nodeToParticle particleFlyAnimation:sweet2 scene:s scaleNo:scale];
        [money addBalance:[inventory slotCalculation:3]];
        //NSLog(@"Slot 3 Earnings = %d", [inventory slotCalculation:3]);
        
    }
    if(inventoryUnlocked >= 4){
        SKSpriteNode *sweet3 = [defaultSweet addSweet:s pos:p slotID:4];
        [nodeToParticle particleFlyAnimation:sweet3 scene:s scaleNo:scale];
        [money addBalance:[inventory slotCalculation:4]];
        //NSLog(@"Slot 4 Earnings = %d", [inventory slotCalculation:4]);
        
    }
    if(inventoryUnlocked >= 5){
            SKSpriteNode *sweet4 = [defaultSweet addSweet:s pos:p slotID:5];
            [nodeToParticle particleFlyAnimation:sweet4 scene:s scaleNo:scale];
            [money addBalance:[inventory slotCalculation:5]];
            //NSLog(@"Slot 4 Earnings = %d", [inventory slotCalculation:4]);
            
        }
    }
}
+(float)determineScale {
    if(inventoryUnlocked == 1){
        return 0.3;
    }
    if(inventoryUnlocked == 2){
        return 0.3;
    }
    if(inventoryUnlocked == 3){
        return 0.3;
    }
    if(inventoryUnlocked == 4){
        return 0.3;
    }else {
        return 0.005;
    }
}
+(int)getInventoryUnlocked {
    return inventoryUnlocked;
}
@end
