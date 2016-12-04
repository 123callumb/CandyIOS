//
//  buttonCreator.m
//  Candy
//
//  Created by Callum Beckwith on 04/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "buttonCreator.h"
#import "sweetCustomMenu.h"

@implementation buttonCreator
+(void)createSweetButton: (SKSpriteNode*)s text:(NSString*)text buttonName:(NSString*)name position:(CGPoint)pos {
    SKSpriteNode *button = [SKSpriteNode spriteNodeWithImageNamed:@"sweetBlueButton"];
    SKLabelNode *buttonText = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    button.position = pos;
    buttonText.text = text;
    buttonText.fontColor = [SKColor blackColor];
    buttonText.position = CGPointMake(0, -button.frame.size.height/10);
    button.name = name;
    buttonText.name = name;
    [button addChild:buttonText];
    buttonText.fontSize = 120;
    [s addChild:button];
}
+(void)animateOnPress: (SKSpriteNode*)s scene:(SKScene*)sk {
    if([s.name isEqualToString:@"sweetTypeButton"] || [s.name isEqualToString:@"sweetFlavourButton"]){
        
        SKAction *shrink = [SKAction scaleBy:0.8 duration:0.1];
        SKAction *grow = [SKAction scaleBy:1.25 duration:0.1];
       
        [s runAction:shrink completion:^{
            [s runAction:grow];
            if ([s.name isEqualToString:@"sweetTypeButton"]) {
                [sweetCustomMenu menuActions:sk inScene:true];
            }else {
                
            }
        }];
        
    }
}
@end
