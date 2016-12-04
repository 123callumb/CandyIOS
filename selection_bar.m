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
    item1 = [SKSpriteNode spriteNodeWithImageNamed:@"hatButtonPressed"];
    item2 = [SKSpriteNode spriteNodeWithImageNamed:@"trousersButton"];
    item3 = [SKSpriteNode spriteNodeWithImageNamed:@"shirtButton"];
    item4 = [SKSpriteNode spriteNodeWithImageNamed:@"shoesButton"];
    item5 = [SKSpriteNode spriteNodeWithImageNamed:@"presetButton"];
    
    item1.zPosition = 4;
    item2.zPosition = 4;
    item3.zPosition = 4;
    item4.zPosition = 4;
    item5.zPosition = 4;
    
    float scale = 1.2;
    
    item1.xScale = scale;
    item2.xScale = scale;
    item3.xScale = scale;
    item4.xScale = scale;
    item5.xScale = scale;

    item1.yScale = scale;
    item2.yScale = scale;
    item3.yScale = scale;
    item4.yScale = scale;
    item5.yScale = scale;
    
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
    

    float yVal = s.frame.size.height/3.7;
    
    item1.position = CGPointMake(s.frame.size.width/10, yVal);
    item2.position = CGPointMake(item1.position.x + item1.frame.size.width, yVal);
    item3.position = CGPointMake(item2.position.x + item1.frame.size.width, yVal);
    item4.position = CGPointMake(item3.position.x + item1.frame.size.width, yVal);
    item5.position = CGPointMake(item4.position.x + item1.frame.size.width, yVal);
    selected.position = CGPointMake(s.frame.size.width / 2, s.frame.size.height );
    
    backBar.position = CGPointMake(0, s.frame.size.height - backBar.frame.size.height);
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"isPreset"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //adding them to scene
    //[s addChild:backBar];
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
        item1.texture = [SKTexture textureWithImageNamed:@"hatButtonPressed"];
        item2.texture = [SKTexture textureWithImageNamed:@"trousersButton"];
        item3.texture = [SKTexture textureWithImageNamed:@"shirtButton"];
        item4.texture = [SKTexture textureWithImageNamed:@"shoesButton"];
        item5.texture = [SKTexture textureWithImageNamed:@"presetButton"];
        
        selected.texture = [SKTexture textureWithImageNamed:@"spr_display_item_0"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"isPreset"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
    }
    if([n.name isEqualToString:@"item2"]){
        imageState = 1;
        item1.texture = [SKTexture textureWithImageNamed:@"hatButton"];
        item2.texture = [SKTexture textureWithImageNamed:@"trousersButtonPressed"];
        item3.texture = [SKTexture textureWithImageNamed:@"shirtButton"];
        item4.texture = [SKTexture textureWithImageNamed:@"shoesButton"];
        item5.texture = [SKTexture textureWithImageNamed:@"presetButton"];
        
        selected.texture = [SKTexture textureWithImageNamed:@"spr_display_item_2"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"isPreset"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    if([n.name isEqualToString:@"item3"]){
        imageState = 2;
        item1.texture = [SKTexture textureWithImageNamed:@"hatButton"];
        item2.texture = [SKTexture textureWithImageNamed:@"trousersButton"];
        item3.texture = [SKTexture textureWithImageNamed:@"shirtButtonPressed"];
        item4.texture = [SKTexture textureWithImageNamed:@"shoesButton"];
        item5.texture = [SKTexture textureWithImageNamed:@"presetButton"];
        
        selected.texture = [SKTexture textureWithImageNamed:@"spr_display_item_1"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"isPreset"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    if([n.name isEqualToString:@"item4"]){
        imageState = 3;
        item1.texture = [SKTexture textureWithImageNamed:@"hatButton"];
        item2.texture = [SKTexture textureWithImageNamed:@"trousersButton"];
        item3.texture = [SKTexture textureWithImageNamed:@"shirtButton"];
        item4.texture = [SKTexture textureWithImageNamed:@"bootsButtonPressed"];
        item5.texture = [SKTexture textureWithImageNamed:@"presetButton"];
        
        selected.texture = [SKTexture textureWithImageNamed:@"spr_display_item_3"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"isPreset"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    if([n.name isEqualToString:@"item5"]){
        imageState = 4;
        item1.texture = [SKTexture textureWithImageNamed:@"hatButton"];
        item2.texture = [SKTexture textureWithImageNamed:@"trousersButton"];
        item3.texture = [SKTexture textureWithImageNamed:@"shirtButton"];
        item4.texture = [SKTexture textureWithImageNamed:@"shoesButton"];
        item5.texture = [SKTexture textureWithImageNamed:@"presetButtonPressed"];
        
        selected.texture = [SKTexture textureWithImageNamed:@"spr_display_item_4"];
        
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"isPreset"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    state = imageState;
}



@end
