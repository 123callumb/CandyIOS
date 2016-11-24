//
//  sweetPicker.m
//  Candy
//
//  Created by Callum Beckwith on 20/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetPicker.h"
#import "slot1Data.h"
#import "registerBoxes.h"
#import "sweetData.h"

@implementation sweetPicker
int sweetNum = 0;
+(void)addSweetPicker: (SKSpriteNode*)s {

    SKSpriteNode *arrowLeft = [SKSpriteNode spriteNodeWithImageNamed:@"arrrowLeft"];
    SKSpriteNode *arrowRight = [SKSpriteNode spriteNodeWithImageNamed:@"arrowRight"];
    
    SKSpriteNode *sweet = [SKSpriteNode spriteNodeWithImageNamed:[sweetData textureDecider:[slot1Data getSweet:[registerBoxes getSlotPressed]]]];
    
    arrowLeft.name = @"arrowLeftSweetPicker";
    arrowRight.name = @"arrowRightSweetPicker";
    sweet.name = @"sweetPicker";
    
    arrowLeft.position = CGPointMake(-s.frame.size.width/2, s.frame.size.height/2.2);
    arrowRight.position = CGPointMake(s.frame.size.width/2, s.frame.size.height/2.2);
    
    sweet.position = CGPointMake(0, s.frame.size.height/2.2);

    [s addChild:sweet];
    [s addChild:arrowLeft];
    [s addChild:arrowRight];
}
+(void)onArrowPress: (SKSpriteNode*)obj scene:(SKScene*)s {
    
    SKAction *shirnk = [SKAction scaleBy:0.8 duration:0.1];
    SKAction *grow = [SKAction scaleBy:1.25 duration:0.1];

    if([obj.name isEqualToString:@"arrowLeftSweetPicker"]){
        [obj runAction:shirnk completion:^{
            [obj runAction:grow];
            if(sweetNum > 0){
                sweetNum = sweetNum - 1;
                [self changeSweet:s];
            }
        }];
    }
    if([obj.name isEqualToString:@"arrowRightSweetPicker"]){
        [obj runAction:shirnk completion:^{
            [obj runAction:grow];
            if(sweetNum < 2){
                sweetNum = sweetNum + 1;
                [self changeSweet:s];
            }
        }];
    }
}
+(void)changeSweet: (SKScene*)s {
    SKSpriteNode *topNode = (SKSpriteNode*)[s childNodeWithName:@"invBoxTop"];
    SKSpriteNode *sweet = (SKSpriteNode*)[topNode childNodeWithName:@"sweetPicker"];
    
    if(sweetNum == 0){
        sweet.texture = [SKTexture textureWithImageNamed:@"defaultSweet"];
    }
    if(sweetNum == 1){
        sweet.texture = [SKTexture textureWithImageNamed:@"bonbon"];
    }
    if(sweetNum == 2){
        sweet.texture = [SKTexture textureWithImageNamed:@"badSweet"];
    }
}
+(int)getSweetNum {
    return sweetNum;
}
+(void)resetSweetNum {
    sweetNum = 0;
}
@end
