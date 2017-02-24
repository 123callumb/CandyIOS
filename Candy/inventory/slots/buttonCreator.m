//
//  buttonCreator.m
//  Candy
//
//  Created by Callum Beckwith on 04/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "buttonCreator.h"
#import "sweetCustomMenu.h"
#import "box1.h"
#import "sweetData.h"
#import "sweetTypeUI.h"
#import "sweetFavourNode.h"

@implementation buttonCreator
+(void)createSweetButton: (SKSpriteNode*)s text:(NSString*)text buttonName:(NSString*)name position:(CGPoint)pos {
    SKSpriteNode *button = [SKSpriteNode spriteNodeWithImageNamed:@"sweetBlueButton"];
    SKLabelNode *buttonText = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    button.position = pos;
    buttonText.text = text;
    buttonText.fontColor = [SKColor colorWithDisplayP3Red:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1];
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
                [sweetFavourNode menuActions:sk inScene:true];
            }
        }];
        
    }
}

+(void)addButtons: (SKSpriteNode*)s {
    [self addSweetType:s];
    [self addSweetFlavour:s];
}

+(void)addSweetType: (SKSpriteNode*)s {
    for(int i = 1; i <= 5; i++){
        if([box1 getSelectedSlot] == i){
            NSString *sweetType = [sweetData sweetTypeNameDecider:i];
            [buttonCreator createSweetButton:s text:sweetType buttonName:@"sweetTypeButton" position:CGPointMake(0, -s.frame.size.height/2.4)];
        }
    }
}
+(void)addSweetFlavour: (SKSpriteNode*)s {
    for(int i = 1; i <= 5; i++){
        if([box1 getSelectedSlot] == i){
            NSString *sweetFlavour = [sweetData determineFlavourString:i];
            [buttonCreator createSweetButton:s text:sweetFlavour buttonName:@"sweetFlavourButton" position:CGPointMake(0, -s.frame.size.height/1.6)];
        }
    }
}
+(void)refreshButtons: (SKSpriteNode*)s {
    SKSpriteNode *sweetTypeButton = (SKSpriteNode*)[s childNodeWithName:@"sweetTypeButton"];
    SKSpriteNode *sweetFlavourButton = (SKSpriteNode*)[s childNodeWithName:@"sweetFlavourButton"];
    [sweetTypeButton removeFromParent];
    [sweetFlavourButton removeFromParent];
    [self addButtons:s];
}
@end
