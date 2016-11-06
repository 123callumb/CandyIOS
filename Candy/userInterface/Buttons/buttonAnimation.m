//
//  buttonAnimation.m
//  Candy
//
//  Created by Callum Beckwith on 06/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "buttonAnimation.h"

@implementation buttonAnimation
+(void)changeState: (SKNode *)button changeName:(NSString *)name originalName:(NSString *)original; {
    
    SKSpriteNode *but = (SKSpriteNode *)button;
    but.texture = [SKTexture textureWithImageNamed:name];
    
    SKAction *delay = [SKAction waitForDuration:0.2];
    
    [but runAction:delay completion:^{
        but.texture = [SKTexture textureWithImageNamed:original];
    }];
}
@end
