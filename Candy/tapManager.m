//
//  tapManager.m
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "tapManager.h"
#import "coinBarSprite.h"

bool isInMenu = false;

@implementation tapManager

+(void)onTap: (SKScene *)s {
    [coinBarSprite updateText:s];
}
@end
