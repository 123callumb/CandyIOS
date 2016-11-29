//
//  selection_bar.m
//  Character_Maker
//
//  Created by Killian Comerford on 24/11/2016.
//  Copyright © 2016 Killian Comerford. All rights reserved.
//

#import "selection_bar.h"

@implementation selection_bar

SKSpriteNode *backBar = nil;
SKSpriteNode *item1 =  nil;
SKSpriteNode *item2 =  nil;
SKSpriteNode *item3 =  nil;
SKSpriteNode *item4 =  nil;
SKSpriteNode *item5 =  nil;

SKSpriteNode *selected = nil;

int imageState = 0;

+(void)initialize{
    backBar = [SKSpriteNode spriteNodeWithImageNamed:@"spr_choose_item_0"];
    item1 = [SKSpriteNode spriteNodeWithImageNamed:@"spr_item_hats_1"];
    item2 = [SKSpriteNode spriteNodeWithImageNamed:@"spr_item_pants_0"];
    item3 = [SKSpriteNode spriteNodeWithImageNamed:@"spr_item_shirts_0"];
    item4 = [SKSpriteNode spriteNodeWithImageNamed:@"spr_item_shoes_0"];
    item5 = [SKSpriteNode spriteNodeWithImageNamed:@"spr_item_presets_0"];
    
    selected = [SKSpriteNode spriteNodeWithImageNamed:@"spr_display_item_0"];
    
}

+(void)spawn:(SKScene*)s{
    
    //declaring sprites
    
    //setting anchor points to 0 to understand easier
    backBar.anchorPoint = CGPointMake(0, 0);
    item1.anchorPoint = CGPointMake(0, 0);
    item2.anchorPoint = CGPointMake(0, 0);
    item3.anchorPoint = CGPointMake(0, 0);
    item4.anchorPoint = CGPointMake(0, 0);
    item5.anchorPoint = CGPointMake(0, 0);
    selected.anchorPoint = CGPointMake(0.5, 1);
    
    item1.name = @"item1";
    item2.name = @"item2";
    item3.name = @"item3";
    item4.name = @"item4";
    item5.name = @"item5";
    
    item1.position = CGPointMake(30, s.frame.size.height - item1.frame.size.height-30);
    item2.position = CGPointMake(170, s.frame.size.height - item1.frame.size.height-30);
    item3.position = CGPointMake(310, s.frame.size.height - item1.frame.size.height-30);
    item4.position = CGPointMake(450, s.frame.size.height - item1.frame.size.height-30);
    item5.position = CGPointMake(590, s.frame.size.height - item1.frame.size.height-30);
    selected.position = CGPointMake(s.frame.size.width / 2, s.frame.size.height - backBar.frame.size.height);
    
    backBar.position = CGPointMake(0, s.frame.size.height - backBar.frame.size.height);
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"isPreset"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //adding them to scene
    [s addChild:backBar];
    [s addChild:item1];
    [s addChild:item2];
    [s addChild:item3];
    [s addChild:item4];
    [s addChild:item5];
    [s addChild:selected];
}

+(void)onTouch:(SKNode*)n imgst:(int)state{
    if([n.name isEqualToString:@"item1"]){
        imageState = 0;
        item1.texture = [SKTexture textureWithImageNamed:@"spr_item_hats_1"];
        item2.texture = [SKTexture textureWithImageNamed:@"spr_item_pants_0"];
        item3.texture = [SKTexture textureWithImageNamed:@"spr_item_shirts_0"];
        item4.texture = [SKTexture textureWithImageNamed:@"spr_item_shoes_0"];
        item5.texture = [SKTexture textureWithImageNamed:@"spr_item_presets_0"];
        
        selected.texture = [SKTexture textureWithImageNamed:@"spr_display_item_0"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"isPreset"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
    }
    if([n.name isEqualToString:@"item2"]){
        imageState = 1;
        item1.texture = [SKTexture textureWithImageNamed:@"spr_item_hats_0"];
        item2.texture = [SKTexture textureWithImageNamed:@"spr_item_pants_1"];
        item3.texture = [SKTexture textureWithImageNamed:@"spr_item_shirts_0"];
        item4.texture = [SKTexture textureWithImageNamed:@"spr_item_shoes_0"];
        item5.texture = [SKTexture textureWithImageNamed:@"spr_item_presets_0"];
        
        selected.texture = [SKTexture textureWithImageNamed:@"spr_display_item_2"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"isPreset"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    if([n.name isEqualToString:@"item3"]){
        imageState = 2;
        item1.texture = [SKTexture textureWithImageNamed:@"spr_item_hats_0"];
        item2.texture = [SKTexture textureWithImageNamed:@"spr_item_pants_0"];
        item3.texture = [SKTexture textureWithImageNamed:@"spr_item_shirts_1"];
        item4.texture = [SKTexture textureWithImageNamed:@"spr_item_shoes_0"];
        item5.texture = [SKTexture textureWithImageNamed:@"spr_item_presets_0"];
        
        selected.texture = [SKTexture textureWithImageNamed:@"spr_display_item_1"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"isPreset"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    if([n.name isEqualToString:@"item4"]){
        imageState = 3;
        item1.texture = [SKTexture textureWithImageNamed:@"spr_item_hats_0"];
        item2.texture = [SKTexture textureWithImageNamed:@"spr_item_pants_0"];
        item3.texture = [SKTexture textureWithImageNamed:@"spr_item_shirts_0"];
        item4.texture = [SKTexture textureWithImageNamed:@"spr_item_shoes_1"];
        item5.texture = [SKTexture textureWithImageNamed:@"spr_item_presets_0"];
        
        selected.texture = [SKTexture textureWithImageNamed:@"spr_display_item_3"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"isPreset"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    if([n.name isEqualToString:@"item5"]){
        imageState = 4;
        item1.texture = [SKTexture textureWithImageNamed:@"spr_item_hats_0"];
        item2.texture = [SKTexture textureWithImageNamed:@"spr_item_pants_0"];
        item3.texture = [SKTexture textureWithImageNamed:@"spr_item_shirts_0"];
        item4.texture = [SKTexture textureWithImageNamed:@"spr_item_shoes_0"];
        item5.texture = [SKTexture textureWithImageNamed:@"spr_item_presets_1"];
        
        selected.texture = [SKTexture textureWithImageNamed:@"spr_display_item_4"];
        
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"isPreset"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    state = imageState;
}



@end
