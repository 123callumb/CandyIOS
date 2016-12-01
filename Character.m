//
//  Character.m
//  Candy
//
//  Created by Killian Comerford on 29/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "Character.h"

@implementation Character
+(void)Spawn:(SKScene*)s Position:(CGPoint)Pos Scale:(double)scale{
    NSString *HatName = [[NSUserDefaults standardUserDefaults] stringForKey:@"hatsVal"];
    NSString *PantsName = [[NSUserDefaults standardUserDefaults] stringForKey:@"pantsVal"];
    NSString *ShirtName = [[NSUserDefaults standardUserDefaults] stringForKey:@"shirtsVal"];
    NSString *ShoesName = [[NSUserDefaults standardUserDefaults] stringForKey:@"shoesVal"];
    NSString *PresetName = [[NSUserDefaults standardUserDefaults] stringForKey:@"presetVal"];
    
    SKSpriteNode *base = [SKSpriteNode spriteNodeWithImageNamed:@"spr_character_base_0"];
    SKSpriteNode *hue = [SKSpriteNode spriteNodeWithImageNamed:@"spr_character_hue_0"];
    SKSpriteNode *hat = [SKSpriteNode spriteNodeWithImageNamed:HatName];
    SKSpriteNode *shirt = [SKSpriteNode spriteNodeWithImageNamed:ShirtName];
    SKSpriteNode *pants = [SKSpriteNode spriteNodeWithImageNamed:PantsName];
    SKSpriteNode *shoes = [SKSpriteNode spriteNodeWithImageNamed:ShoesName];
    SKSpriteNode *preset = [SKSpriteNode spriteNodeWithImageNamed:PresetName];
    //checkennugget

    SKSpriteNode *shadow = [SKSpriteNode spriteNodeWithImageNamed:@"spr_shadow_0"];
    
    //Hat Shadow
    SKSpriteNode *HatShadow = [SKSpriteNode spriteNodeWithImageNamed:HatName];
    HatShadow.color = [SKColor blackColor];
    HatShadow.alpha = 0.1;
    HatShadow.colorBlendFactor = 1;
    
    base.position = Pos;
    hue.position = Pos;
    hat.position = Pos;
    shirt.position = Pos;
    pants.position = Pos;
    shoes.position = Pos;
    preset.position = Pos;
    shadow.position = Pos;
    HatShadow.position = CGPointMake(Pos.x+10, Pos.y-10);
    
    //test 123 test 123
    
    base.xScale = scale;
    base.yScale = scale;
    hue.xScale = scale;
    hue.yScale = scale;
    hat.xScale = scale;
    hat.yScale = scale;
    shirt.xScale = scale;
    shirt.yScale = scale;
    pants.xScale = scale;
    pants.yScale = scale;
    shoes.xScale = scale;
    shoes.yScale = scale;
    preset.xScale = scale;
    preset.yScale = scale;
    HatShadow.xScale = scale;
    HatShadow.yScale = scale;
    shadow.xScale = scale;
    shadow.yScale = scale;
    
    CGPoint Anchor = CGPointMake(0.5, 0);
    
    base.anchorPoint = Anchor;
    hue.anchorPoint = Anchor;
    hat.anchorPoint = Anchor;
    shirt.anchorPoint = Anchor;
    pants.anchorPoint = Anchor;
    shoes.anchorPoint = Anchor;
    preset.anchorPoint = Anchor;
    shadow.anchorPoint = Anchor;
    HatShadow.anchorPoint = Anchor;
    
    base.zPosition = -2;
    hue.zPosition = -2;
    hat.zPosition = -2;
    shirt.zPosition = -2;
    pants.zPosition = -2;
    shoes.zPosition = -2;
    preset.zPosition = -2;
    shadow.zPosition = -2;
    HatShadow.zPosition = -2;
    
    shadow.alpha = 0.1;
    hue.alpha = [[NSUserDefaults standardUserDefaults] doubleForKey:@"Alpha"];
    
    long isPre = [[NSUserDefaults standardUserDefaults] integerForKey:@"isPreset"];
    
    //CHECK PUSH CHECK PUSH
    
    [s addChild:shadow];
    if(isPre == 0)[s addChild:HatShadow];
    [s addChild:base];
    [s addChild:hue];
    if(isPre == 0){
        [s addChild:hat];
        [s addChild:shirt];
        [s addChild:pants];
        [s addChild:shoes];
    }
    else if(isPre == 1){
        [s addChild:preset];
    }
}
@end
