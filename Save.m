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
    SaveButton = [SKSpriteNode spriteNodeWithImageNamed:@"doneButton"];
    SaveButton.position = CGPointMake(s.frame.size.width /2, s.frame.size.height/10);
    SaveButton.xScale = 0.55;
    SaveButton.yScale = 0.55;
    SaveButton.name = @"SaveButton";
    
    [s addChild:SaveButton];
}
+(void)onTouch:(SKNode*)n scene:(SKScene*)s{
    if([n.name isEqualToString:@"SaveButton"]){
        //animation
        SaveButton.texture = [SKTexture textureWithImageNamed:@"donePressured"];
        SKAction *delay = [SKAction waitForDuration:0.5];
        [SaveButton runAction:delay completion:^{
            SaveButton.texture = [SKTexture textureWithImageNamed:@"doneButton"];
        }];
        //set NSUSERDEFAULT so that the character creator wont open again on launch
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"spawnCreator"];
        //switch Scene
        SKAction *splashTime = [SKAction waitForDuration:0];
        [s runAction:splashTime completion:^{
            [mainTransition switchScene:s sceneTwo:@"main" Transition:[SKTransition crossFadeWithDuration:1]];
        }];
    }
}

@end
