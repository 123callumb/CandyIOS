//
//  flavourPicker.m
//  Candy
//
//  Created by Callum Beckwith on 22/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "flavourPicker.h"
#import "slot1Data.h"
#import "registerBoxes.h"

@implementation flavourPicker
int flavourNum = 0;

+(void)addFlavourPicker: (SKSpriteNode*)s {
    
    SKSpriteNode *arrowLeft = [SKSpriteNode spriteNodeWithImageNamed:@"arrrowLeft"];
    SKSpriteNode *arrowRight = [SKSpriteNode spriteNodeWithImageNamed:@"arrowRight"];

    SKLabelNode *flavourText = [SKLabelNode labelNodeWithFontNamed:@"Coder's-Crux"];
    flavourText.text = [self determineFlavourString:flavourNum];
    flavourText.name = @"flavourPickerText";
    flavourText.fontSize = 175;
    flavourText.fontColor = [UIColor blackColor];
    
    arrowLeft.name = @"arrowLeftFlavour";
    arrowRight.name = @"arrowRightFlavour";
    
    arrowLeft.position = CGPointMake(-s.frame.size.width/1.6, -s.frame.size.height/3.7);
    arrowRight.position = CGPointMake(s.frame.size.width/1.6, -s.frame.size.height/3.7);
    flavourText.position = CGPointMake(0, -s.frame.size.height/3.3);
    
    [s addChild:arrowRight];
    [s addChild:arrowLeft];
    [s addChild:flavourText];
}

+(void)onArrowPress: (SKSpriteNode*)obj scene:(SKScene*)s {
    
    SKAction *shirnk = [SKAction scaleBy:0.8 duration:0.1];
    SKAction *grow = [SKAction scaleBy:1.25 duration:0.1];
    
    SKSpriteNode *menu = (SKSpriteNode*)[s childNodeWithName:@"invBoxTop"];
    SKLabelNode *textLabel = (SKLabelNode*)[menu childNodeWithName:@"flavourPickerText"];
    
    if([obj.name isEqualToString:@"arrowLeftFlavour"]){
        [obj runAction:shirnk completion:^{
            [obj runAction:grow];
            if(flavourNum > 0){
                flavourNum = flavourNum - 1;
                textLabel.text = [self determineFlavourString:flavourNum];
                NSLog(@"%d should be set for slot %d", flavourNum, [registerBoxes getSlotPressed]);
                [slot1Data setFlavour:flavourNum sweetNum:[registerBoxes getSlotPressed]];
            }
        }];
    }
    if([obj.name isEqualToString:@"arrowRightFlavour"]){
        [obj runAction:shirnk completion:^{
            [obj runAction:grow];
            if(flavourNum < 4){
                flavourNum = flavourNum + 1;
                textLabel.text = [self determineFlavourString:flavourNum];
                 [slot1Data setFlavour:flavourNum sweetNum:[registerBoxes getSlotPressed]];
                NSLog(@"%d should be set for slot %d", flavourNum, [registerBoxes getSlotPressed]);

            }
        }];
    }
}

+(NSString*)determineFlavourString: (int)flavourID {
    if(flavourID == 1){
        return @"Mint";
    }
    if(flavourID == 2){
        return @"Coke";
    }
    if(flavourID == 3){
        return @"Strawberry";
    }
    if (flavourID == 4) {
        return @"Chocolate";
    }else {
        return @"No Flavour";
    }
}
+(int)getFlavourPicked {
    return flavourNum;
}
+(void)resetFlavour {
    flavourNum = 0;
}
@end
