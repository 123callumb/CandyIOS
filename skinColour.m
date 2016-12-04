//
//  skinColour.m
//  Character_Maker
//
//  Created by Killian Comerford on 25/11/2016.
//  Copyright © 2016 Killian Comerford. All rights reserved.
//

#import "skinColour.h"

SKSpriteNode *bar = nil;
SKSpriteNode *slider = nil;
SKSpriteNode *BaseHue = nil;

CGPoint *StartPoint = nil;
CGPoint *EndPoint = nil;
double BarVal = 0;

@implementation skinColour
+(void)SpawnTextures:(SKScene*)s{
    bar = [SKSpriteNode spriteNodeWithImageNamed:@"hueBar"];
    slider = [SKSpriteNode spriteNodeWithImageNamed:@"hueSliderButton"];
    BaseHue =[SKSpriteNode spriteNodeWithImageNamed:@"spr_character_hue_0"];
    slider.position = CGPointMake(s.frame.size.width / 2 - 90, s.frame.size.height/4.4);
    bar.position = CGPointMake(s.frame.size.width / 2 , s.frame.size.height/4.4);
    BaseHue.position = CGPointMake(s.frame.size.width/1.9, s.frame.size.height/1.65);
    
    BarVal = (slider.position.x - (bar.position.x - (bar.frame.size.width / 2) + 30.0f)) /260;
    BaseHue.alpha = BarVal;
    
    slider.name = @"slider";
    
    [[NSUserDefaults standardUserDefaults] setDouble:BarVal forKey:@"Alpha"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [s addChild:BaseHue];
    [s addChild:bar];
    [s addChild:slider];
}
+(void)touchDown:(SKSpriteNode*)s location:(CGPoint)point {
    if([s.name isEqualToString:@"slider"]){
        if(point.x >= (bar.position.x - (bar.frame.size.width / 2) + 30.0f) &&
           point.x <= (bar.position.x + (bar.frame.size.width / 2) - 30.0f)){
            s.position = CGPointMake(point.x, slider.position.y);
            BarVal = (point.x - (bar.position.x - (bar.frame.size.width / 2) + 30.0f)) /260;
            NSLog(@"%f", BarVal);
            
            BaseHue.alpha = BarVal;
            
            [[NSUserDefaults standardUserDefaults] setDouble:BarVal forKey:@"Alpha"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
}
+(void)touchUp{
    slider.texture = [SKTexture textureWithImageNamed:@"spr_hue_slider_0"];
}

@end
