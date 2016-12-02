//
//  candyMachines.m
//  Candy
//
//  Created by Killian Comerford on 02/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "candyMachines.h"

SKSpriteNode *machineBase;
SKSpriteNode *stamper;
SKSpriteNode *button;

@implementation candyMachines
+(void)baseMachine:(SKScene*)s {
    machineBase = [SKSpriteNode spriteNodeWithImageNamed:@"candy_machine_base"];
    stamper = [SKSpriteNode spriteNodeWithImageNamed:@"stamper"];
    button = [SKSpriteNode spriteNodeWithImageNamed:@"button_0"];
    
    machineBase.zPosition = -3;
    machineBase.xScale = 1.56;
    machineBase.yScale = 1.56;
    machineBase.anchorPoint = CGPointMake(0.5, 0);
    machineBase.position = CGPointMake(0, -460);
    
    stamper.zPosition = -3;
    stamper.xScale = 1.56;
    stamper.yScale = 1.56;
    stamper.anchorPoint = CGPointMake(0.5, 0);
    stamper.position = CGPointMake(0, -460);
    
    button.zPosition = -3;
    button.xScale = 1.56;
    button.yScale = 1.56;
    button.anchorPoint = CGPointMake(0.5, 0);
    button.position = CGPointMake(0, -460);
    
    [s addChild:stamper];
    [s addChild:button];
    [s addChild:machineBase];
}
+(void)onTouch:(SKNode*)n{
    button.texture = [SKTexture textureWithImageNamed:@"button_1"];
    SKAction *delay = [SKAction waitForDuration:0.1];
    [button runAction:delay completion:^{
        button.texture = [SKTexture textureWithImageNamed:@"button_0"];
    }];
    
    SKAction *stampDown = [SKAction moveToY:-531 duration:0.05];
    SKAction *stampUp = [SKAction moveToY:-460 duration:0.05];
    [stamper runAction:stampDown completion:^{
        [stamper runAction:stampUp];
    }];

}
@end
