//
//  fiftyTapBonus.m
//  Candy
//
//  Created by Callum Beckwith on 06/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "fiftyTapBonus.h"
#import "defaultSweet.h"
#import "coinSpawner.h"
#import "box1.h"
#import "gems.h"
#import "gemAnimations.h"
#import "optimiseCandyMachineData.h"
#import "specialBonus.h"

@implementation fiftyTapBonus
int tapCollector = 0;
+(void)reward:(SKScene*)s {
    int rewardTypeNum = [self randomNumberBetween:1 maxNumber:5];
    
    if(rewardTypeNum <= 1){
        
        [specialBonus spawnSpecialItem:s];
        //Multiplier or Auto tap reward
        NSLog(@"Won a special tap reward");
    }else if([[optimiseCandyMachineData getCurrentSlotState] count] >= 1){
        int lowerBound = 0;
        int upperBound = (int)[[optimiseCandyMachineData getCurrentSlotState] count]-1;
        int rndValue = [self randomNumberBetween:lowerBound maxNumber:upperBound];
        NSLog(@"Won a sweet tap reward");
        [self createRandomSweetBonus:rndValue scene:s];
    }
}
+(void)createRandomSweetBonus:(int)sweetSlotID scene:(SKScene*)s {
    
    int rndTexValue = [self randomNumberBetween:0 maxNumber:(int)[[optimiseCandyMachineData getCurrentSlotState] count] - 1];
    NSString *texture = [[optimiseCandyMachineData getCurrentSlotState] objectAtIndex:rndTexValue];
    NSLog(@"%@", texture);
    
    if([texture isEqualToString:@"emptyDraw"]){
        if(![[[optimiseCandyMachineData getCurrentSlotState] objectAtIndex:0] isEqualToString:@"emptyDraw"]){
            texture = [[optimiseCandyMachineData getCurrentSlotState] objectAtIndex:0];
        }
    }

    if(![texture isEqualToString:@"emptyDraw"]){
        SKSpriteNode *sweet = [SKSpriteNode spriteNodeWithImageNamed:texture];
        sweet.alpha = 0;
        sweet.xScale = 0.2;
        sweet.yScale = 0.2;
        sweet.name = @"bonusPresent";
        sweet.zPosition = 8;
        sweet.position = [(SKSpriteNode*)[s childNodeWithName:@"comboBar"] position];
        [s addChild:sweet];
        SKAction *fadeIn = [SKAction fadeInWithDuration:0.2];
        SKAction *scaleIn = [SKAction scaleTo:0.6 duration:0.2];
        [sweet runAction:scaleIn];
        [sweet runAction:fadeIn];
        sweet.physicsBody = [SKPhysicsBody bodyWithTexture:sweet.texture size:sweet.frame.size];
    }
}
+(void)onTouchofBonus:(SKSpriteNode*)obj scene:(SKScene*)s {
    if([obj.name isEqualToString:@"bonusPresent"]){
        int lowerBound = 1;
        int upperBound = 100;
        int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
        if(rndValue > 80){
            [gemAnimations miniGemExplosion:obj scene:s];
        }else {
            [coinSpawner coinExplosion:obj scene:s];
        }
    }
}
+(int)randomNumberBetween:(int)min maxNumber:(int)max
{
    return (int)(min + arc4random_uniform(max - min + 1));
}
@end
