//
//  inventoryButton.m
//  Candy
//
//  Created by Callum Beckwith on 06/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "inventoryButton.h"
#import "buttonAnimation.h"
#import "inventoryMenu.h"

@implementation inventoryButton
bool isActive = false;

+(void)addButton: (SKScene *)s {
    
    SKSpriteNode *buttonInventory = [SKSpriteNode spriteNodeWithImageNamed:@"pointlessButton"];
    buttonInventory.anchorPoint = CGPointMake(0.5, 0.5);
    buttonInventory.position = CGPointMake(0, -s.frame.size.height/2.25);
    buttonInventory.xScale = 0.45;
    buttonInventory.yScale = 0.45;
    buttonInventory.zPosition = 11;
    buttonInventory.name = @"buttonInventory";
    [s addChild:buttonInventory];
}
+(void)onTouch: (SKNode *)b cs:(SKScene *)s {
    
    [buttonAnimation changeState:b changeName:@"pointlessButtonPressed" originalName:@"pointlessButton"];
    
    if(isActive == false){
        [inventoryMenu menuActions:s inScene:true];
    }
     else if(isActive == true){
         [inventoryMenu menuActions:s inScene:false];
    }
}
+(void)invActive {
    isActive = true;
}
+(void)invDeactive {
    isActive = false;
}
@end
