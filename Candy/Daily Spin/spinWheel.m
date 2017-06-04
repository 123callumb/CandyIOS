//
//  spinWheel.m
//  Candy
//
//  Created by Callum Beckwith on 12/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "spinWheel.h"
#import "mainTransition.h"
#import "spinData.h"
#import "buttonAnimation.h"
#import "spinBox.h"

@implementation spinWheel
+(void)addWheel:(SKScene *)s {
    SKSpriteNode *newWheel = [SKSpriteNode spriteNodeWithImageNamed:@"mainSpin"];
    newWheel.position = CGPointMake(0, 0);
    newWheel.size = CGSizeMake(s.frame.size.width, s.frame.size.height);
    newWheel.name = @"prizeBox";
    SKSpriteNode *spinButton = [SKSpriteNode spriteNodeWithImageNamed:@"spinButton"];
    spinButton.position = CGPointMake(0, -s.frame.size.height/3.175);
    [spinButton setScale:0.54];
    spinButton.name = @"spinButton";
    [newWheel addChild:spinButton];
    [s addChild:newWheel];
}
+(void)onBoxInteraction:(SKScene*)s box:(SKSpriteNode*)box {
    if([box.name isEqualToString:@"spinButton"]){
        [buttonAnimation changeState:box changeName:@"spinButtonPressed" originalName:@"spinButton"];
        [spinBox beginBoxSpinning:s];
        
    }
}

@end
