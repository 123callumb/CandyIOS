//
//  Character.m
//  Candy
//
//  Created by Killian Comerford on 29/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "Character.h"

@implementation Character
+(void)Spawn:(SKScene*)s Position:(CGPoint)Pos{
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
