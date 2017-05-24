//
//  specialBonus.m
//  Candy
//
//  Created by Callum Beckwith on 24/05/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "specialBonus.h"
#import "specialsItem.h"
#import "specialsData.h"
#import "sparks.h"

@implementation specialBonus
+(NSArray*)specials {
    NSArray *items = [[NSArray alloc] initWithObjects:@"5xIcon",
                      @"10xIcon",
                      @"15xIcon",
                      nil];
    return items;
}
+(void)spawnSpecialItem:(SKScene*)s {
    
    int rndVal = [self randomNumberBetween:1 maxNumber:50];
    
    NSString *texture;
    
    if(rndVal <= 35){
        texture = [[self specials] objectAtIndex:0];
    }
    if(rndVal > 35 && rndVal <= 45 ){
        texture = [[self specials] objectAtIndex:1];
    }
    if(rndVal > 45 && rndVal <= 50){
        texture = [[self specials] objectAtIndex:2];
    }
//    if(rndVal > 50 && rndVal <= 85){
//        texture = [[self specials] objectAtIndex:3];
//    }
//    if(rndVal > 85 && rndVal <= 95 ){
//        texture = [[self specials] objectAtIndex:4];
//    }
//    if(rndVal > 95 && rndVal <= 100){
//        texture = [[self specials] objectAtIndex:5];
//    }
    
    [self createSpecialNode:s texture:texture];
}

+(void)createSpecialNode:(SKScene*)s texture:(NSString*)texture {
    SKSpriteNode *sweet = [SKSpriteNode spriteNodeWithImageNamed:texture];
    sweet.alpha = 0;
    sweet.xScale = 0.05;
    sweet.yScale = 0.05;
    sweet.name = [NSString stringWithFormat:@"bonusSpecial_%@", texture];
    sweet.zPosition = 8;
    sweet.position = [(SKSpriteNode*)[s childNodeWithName:@"comboBar"] position];
    [s addChild:sweet];
    SKAction *fadeIn = [SKAction fadeInWithDuration:0.2];
    SKAction *scaleIn = [SKAction scaleTo:0.6 duration:0.2];
    [sweet runAction:scaleIn];
    [sweet runAction:fadeIn];
    sweet.physicsBody = [SKPhysicsBody bodyWithTexture:sweet.texture size:sweet.frame.size];
}

+(int)randomNumberBetween:(int)min maxNumber:(int)max
{
    return (int)(min + arc4random_uniform(max - min + 1));
}
+(void)onSpecialBonus:(SKSpriteNode*)s onScene:(SKScene*)sc {
    if([s.name containsString:@"bonusSpecial_"]){
        if([s.name containsString:@"5x"]){
            [specialsData activateSpecialWithID:0];
        }
        if([s.name containsString:@"10x"]){
            [specialsData activateSpecialWithID:1];
        }
        if([s.name containsString:@"15x"]){
            [specialsData activateSpecialWithID:2];
        }
        
        [sparks createSpriteSplosion:sc nodeAmount:20 pos:s.position];
        [s removeFromParent];
    }
}
@end
