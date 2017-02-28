//
//  tipsUI.m
//  Candy
//
//  Created by Callum Beckwith on 23/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "tipsUI.h"
#import "settingsData.h"

@implementation tipsUI
+(void)startTipSpawner: (SKScene*)s {
    SKAction *tipTimer = [SKAction waitForDuration:90];
    SKAction *tipSpawner = [SKAction runBlock:^{
        if(![settingsData isTipsEnabled]){
            [self spawnRandomTip:s];
                }
        ;}];
    SKAction *seq = [SKAction sequence:@[tipTimer, tipSpawner]];
    SKAction *repeat = [SKAction repeatActionForever:seq];
    if(![settingsData isTipsEnabled]){
        [s runAction:repeat];
    }
}
+(void)spawnRandomTip:(SKScene*)s {
    SKSpriteNode *tip = [self createTipsUI:[self getRandomTiString]];
    tip.position = CGPointMake(s.frame.size.width, s.frame.size.height/2 - tip.frame.size.height*1.2);
    [s addChild:tip];
    
    SKAction *slideIn = [SKAction moveToX:0 duration:0.4];
    SKAction *stayForAmount = [SKAction waitForDuration:8];
    SKAction *slideOut = [SKAction moveToX:-s.frame.size.width duration:0.4];
    
    [tip runAction:slideIn completion:^{
        [tip runAction:stayForAmount completion:^{
            [tip runAction:slideOut completion:^{
                [tip removeFromParent];
            }];
        }];
    }];
}
+(id)createTipsUI:(NSString*)tipString {
    SKSpriteNode *tipsBG = [SKSpriteNode spriteNodeWithImageNamed:@"tips"];
    tipsBG.xScale = 0.43;
    tipsBG.yScale =0.43;
    tipsBG.zPosition = -4;
    
    SKLabelNode *tipText = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    tipText.text = tipString;
    tipText.fontColor = [SKColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
    tipText.fontSize = 80;
    tipText.position = CGPointMake(0, -tipsBG.frame.size.height/8);
    
    [tipsBG addChild:tipText];
    
    return tipsBG;
}
+(NSString*)getRandomTiString {
    NSArray *tips = [NSArray arrayWithObjects:
                     @"Make more money by selling trending sweets!",
                     @"Earn Gems from the Free Items Menu",
                     @"Upgrade your Building for more Candy Machines",
                     @"Tippy tip tip",
                     nil];
    
    return [tips objectAtIndex:[self randomNumberBetween:0 maxNumber:(int)([tips count] - 1)]];
}
+(int)randomNumberBetween:(int)min maxNumber:(int)max
{
    return (int)min + arc4random_uniform(max - min + 1);
}
@end
