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
#import "combo.h"
#import "comboBar.h"
#import "comboTimer.h"
#import "defaultSweet.h"
#import "nodeToParticle.h"
#import "menuHandler.h"

@implementation taps
+(void)onPressed: (SKScene *)s location:(CGPoint)p {
    if([menuHandler getCurrentMenu] == 4){
    [coinBarSprite updateText:s];
    [money addBalance:1];
    SKSpriteNode *sweet = [defaultSweet addSweet:s pos:p];
    [nodeToParticle particleFlyAnimation:sweet scene:s];
    }
}
+(void)onRelease: (SKScene*)s {
    
}
@end
