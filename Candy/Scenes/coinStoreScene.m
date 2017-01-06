//
//  coinStoreScene.m
//  Candy
//
//  Created by Callum Beckwith on 06/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "coinStoreScene.h"

@implementation coinStoreScene
-(void)didMoveToView:(SKView *)view {
    
    //I decided to just do the sprite sk stuff here as there is only the header that uses it!
    SKSpriteNode *header = [SKSpriteNode spriteNodeWithImageNamed:@"coinStoreHeader"];
    header.size = CGSizeMake(self.frame.size.width, self.frame.size.height/4);
    header.position = CGPointMake(0, self.frame.size.height/4);
    [self addChild:header];
}
@end
