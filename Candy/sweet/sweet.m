//
//  sweet.m
//  Candy
//
//  Created by Callum Beckwith on 09/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweet.h"

@implementation sweet
+(id)createNewSweet: (SKScene*)s sweetName:(NSString*)name textureName:(NSString*)textureName  {
    
    SKSpriteNode *sweet = [SKSpriteNode spriteNodeWithImageNamed:textureName];
    sweet.name = [NSString stringWithFormat:@"sweet_%@", name];
    
    return sweet;
}

@end
