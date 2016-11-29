//
//  Save.m
//  Character_Maker
//
//  Created by Killian Comerford on 28/11/2016.
//  Copyright © 2016 Killian Comerford. All rights reserved.
//

#import "Save.h"
#import "backgroundManager.h"
#import "mainTransition.h"

SKSpriteNode *SaveButton = nil;

int isPreset = 0;
NSString *hatVal;
NSString *PantsVal;
NSString *ShirtVal;
NSString *ShoesVal;
NSString *PresetVal;

@implementation Save
+(void)spawn:(SKScene*)s{
    SaveButton = [SKSpriteNode spriteNodeWithImageNamed:@"spr_save_button_0"];
    SaveButton.position = CGPointMake(s.frame.size.width /2, 120);
    
    SaveButton.name = @"SaveButton";
    
    [s addChild:SaveButton];
}
+(void)onTouch:(SKNode*)n scene:(SKScene*)s{
    if([n.name isEqualToString:@"SaveButton"]){
        //animation
        SaveButton.texture = [SKTexture textureWithImageNamed:@"spr_save_button_1"];
        SKAction *delay = [SKAction waitForDuration:0.5];
        [SaveButton runAction:delay completion:^{
            SaveButton.texture = [SKTexture textureWithImageNamed:@"spr_save_button_0"];
        }];
        
        //switch Scene
        [backgroundManager splashScene:s];
        SKAction *splashTime = [SKAction waitForDuration:0];
        [s runAction:splashTime completion:^{
            [mainTransition switchScene:s sceneTwo:@"main" Transition:[SKTransition crossFadeWithDuration:1]];
        }];
    }
}

@end
