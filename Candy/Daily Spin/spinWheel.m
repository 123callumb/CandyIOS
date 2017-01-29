//
//  spinWheel.m
//  Candy
//
//  Created by Callum Beckwith on 12/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "spinWheel.h"
#import "mainTransition.h"
#import "spinData.h"

@implementation spinWheel

+(void)addWheel: (SKScene*)s {
    SKSpriteNode *wheel = [SKSpriteNode spriteNodeWithImageNamed:@"blankWheel"];
    wheel.name = @"dailySpinWheel";
    wheel.yScale = 0.6;
    wheel.xScale = 0.6;
    wheel.position = CGPointMake(0, - s.frame.size.height/2 + wheel.frame.size.height/2);
    [self addWheelItems:wheel];
    [s addChild:wheel];
    [self addTapScale:s];
    [self addTapMeter:s];
    [self addWheelHolder:s];
}
+(void)addWheelHolder: (SKScene*)s {
    SKSpriteNode *holder = [SKSpriteNode spriteNodeWithImageNamed:@"spinWheelPart"];
    holder.name = @"dailySpinWheelHolder";
    holder.xScale = 0.6;
    holder.yScale = 0.6;
    holder.zPosition = 9;
    holder.position = CGPointMake(0, - s.frame.size.height/2 + holder.frame.size.height/2);
    [s addChild:holder];
}
+(void)addTapMeter: (SKScene*)s {
    SKSpriteNode *meter = [SKSpriteNode spriteNodeWithImageNamed:@"tapMeter"];
    meter.name = @"dailySpinWheelHolder";
    meter.xScale = 0.6;
    meter.yScale = 0.6;
    meter.zPosition = 9;
    meter.position = CGPointMake(0, - s.frame.size.height/2 + meter.frame.size.height/2);
    [s addChild:meter];
}
+(void)addTapScale: (SKScene*)s {
    SKSpriteNode *scaleBg = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:CGSizeMake(s.frame.size.width/30, s.frame.size.height/3.3)];
    scaleBg.position = CGPointMake(0, -s.frame.size.height/2 + s.frame.size.height/6);
    [s addChild:scaleBg];
    SKSpriteNode *scale = [SKSpriteNode spriteNodeWithColor:[SKColor orangeColor] size:CGSizeMake(s.frame.size.width/34, s.frame.size.height/60)];
    scale.position = CGPointMake(0, -s.frame.size.height/2 + s.frame.size.height/48);
    scale.anchorPoint = CGPointMake(0.5, 1);
    scale.zPosition = 9;
    scale.name = @"meterScale";
    [s addChild:scale];
}
+(void)addWheelItems: (SKSpriteNode*)s {
    SKSpriteNode *coin = [SKSpriteNode spriteNodeWithImageNamed:@"coin"];
    coin.anchorPoint = CGPointMake(0.5, 0);
    coin.zRotation = M_PI + M_PI_4;
    coin.xScale = 2;
    coin.yScale = 2;
    coin.name = @"coin";
    coin.zPosition = 8;
    coin.position = CGPointMake(coin.frame.size.height/5, -coin.frame.size.height/5);
    [s addChild:coin];
    SKSpriteNode *coin1 = [SKSpriteNode spriteNodeWithImageNamed:@"coin"];
    coin1.anchorPoint = CGPointMake(0.5, 0);
    coin1.xScale = 2;
    coin1.yScale = 2;
    coin1.zRotation = -M_PI*2 + M_PI_4;
    coin1.zPosition = 8;
    coin1.position = CGPointMake(-coin1.frame.size.height/5, coin1.frame.size.height/5);
    [s addChild:coin1];
    SKSpriteNode *miniGems = [SKSpriteNode spriteNodeWithImageNamed:@"miniGems"];
    miniGems.anchorPoint = CGPointMake(0.5, 0);
    miniGems.xScale = 2;
    miniGems.yScale = 2;
    miniGems.name = @"miniGem";
    miniGems.zRotation = -M_PI*2 - M_PI_4;
    miniGems.position = CGPointMake(miniGems.frame.size.height/40, miniGems.frame.size.height/40);
    [s addChild:miniGems];
    SKSpriteNode *Gem = [SKSpriteNode spriteNodeWithImageNamed:@"gem"];
    Gem.anchorPoint = CGPointMake(0.5, 0);
    Gem.xScale = 2;
    Gem.yScale = 2;
    Gem.name = @"gem";
    Gem.zRotation = M_PI - M_PI_4;
    Gem.position = CGPointMake(-Gem.frame.size.height/10, -Gem.frame.size.height/10);
    [s addChild:Gem];
}
+(void)addPrizeValue: (SKScene*)s text:(NSString*)text pos:(CGPoint)position textSize:(float)size{
    SKLabelNode *textV = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    textV.fontSize = size;
    textV.fontColor = [SKColor blackColor];
    textV.text = text;
    textV.position = position;
    textV.zPosition = 10;
    textV.alpha = 0.0;
    [s addChild:textV];
    SKAction *fadeIn = [SKAction fadeInWithDuration:1];
    [textV runAction:fadeIn];
}
@end
