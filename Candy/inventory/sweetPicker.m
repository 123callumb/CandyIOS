//
//  sweetPicker.m
//  Candy
//
//  Created by Callum Beckwith on 20/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetPicker.h"
#import "slot1Data.h"
#import "registerBoxes.h"
#import "sweetData.h"
#import "box1.h"

@implementation sweetPicker
+(void)addSweet: (SKSpriteNode*)s {
    SKSpriteNode *sweet = [SKSpriteNode spriteNodeWithImageNamed:@"defaultSweet"];
    sweet.name = @"sweetTypeDisplay";
    
    [self textureBasedOnSlot:sweet];
    
    [s addChild:sweet];
}
+(void)textureBasedOnSlot: (SKSpriteNode*)s {
      for(int i = 1; i <= 5; i++){
        if([box1 getSelectedSlot] == i){
            s.texture = [SKTexture textureWithImageNamed:[sweetData textureDecider:i]];
        }
      }
}
+(void)refreshSweetType: (SKSpriteNode*)s {
    SKSpriteNode *sweetType = (SKSpriteNode*)[s childNodeWithName:@"sweetTypeDisplay"];
    [sweetType removeFromParent];
    [self addSweet:s];
}
@end
