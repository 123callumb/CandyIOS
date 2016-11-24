//
//  defaultSweet.m
//  Candy
//
//  Created by Callum Beckwith on 09/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "defaultSweet.h"
#import "sweet.h"
#import "sweetData.h"

@implementation defaultSweet
int upgradeValue = 0;

+(id)addSweet: (SKScene*)s pos:(CGPoint)p slotID:(int)slot; {
    NSString *sweetTexture = [sweetData textureDecider:slot];
    SKSpriteNode *sweetDefault = [sweet createNewSweet:s sweetName:@"particleSweet" textureName:sweetTexture];
    sweetDefault.position = p;
    sweetDefault.zPosition = 4;
    return sweetDefault;
}
+(int)getUpgradeValue {
    return upgradeValue;
}
@end
