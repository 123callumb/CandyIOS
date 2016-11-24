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

@implementation determineSweetTap
int inventoryUnlocked = 3;
+(void)spawn: (SKScene *)s location:(CGPoint)p {
    
    SKSpriteNode *sweet = [defaultSweet addSweet:s pos:p slotID:1];
    float scale = [self determineScale];
    
    [nodeToParticle particleFlyAnimation:sweet scene:s scaleNo:scale];
    
    if(inventoryUnlocked >= 2){
        SKSpriteNode *sweet1 = [defaultSweet addSweet:s pos:p slotID:2];
        [nodeToParticle particleFlyAnimation:sweet1 scene:s scaleNo:scale];

        
    }
    if(inventoryUnlocked >= 3){
        SKSpriteNode *sweet2 = [defaultSweet addSweet:s pos:p slotID:3];
        [nodeToParticle particleFlyAnimation:sweet2 scene:s scaleNo:scale];

        
    }
    if(inventoryUnlocked >= 4){
        SKSpriteNode *sweet3 = [defaultSweet addSweet:s pos:p slotID:4];
        [nodeToParticle particleFlyAnimation:sweet3 scene:s scaleNo:scale];

        
    }
}
+(float)determineScale {
    if(inventoryUnlocked == 1){
        return 0.4;
    }
    if(inventoryUnlocked == 2){
        return 0.3;
    }
    if(inventoryUnlocked == 3){
        return 0.2;
    }
    if(inventoryUnlocked == 4){
        return 0.1;
    }else {
        return 0.005;
    }
}
@end
