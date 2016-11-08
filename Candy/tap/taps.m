//
//  taps.m
//  Candy
//
//  Created by Callum Beckwith on 08/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "taps.h"
#import "coinBarSprite.h"
#import "money.h"

@implementation taps
+(void)onPressed: (SKScene *)s {
    [coinBarSprite updateText:s];
    [money addBalance:1];
}
@end
