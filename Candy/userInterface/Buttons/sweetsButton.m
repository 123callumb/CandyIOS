//
//  sweetsButton.m
//  Candy
//
//  Created by Callum Beckwith on 06/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetsButton.h"
#import "buttonAnimation.h"

@implementation sweetsButton
+(void)addButton: (SKScene *)s; {
    
    SKSpriteNode *buttonSweets = [SKSpriteNode spriteNodeWithImageNamed:@"sweetStoreButtonBetter"];
    buttonSweets.anchorPoint = CGPointMake(0.5, 0.5);
    buttonSweets.position = CGPointMake(buttonSweets.size.width/2.1, -s.frame.size.height/2.25);
    buttonSweets.xScale = 0.45;
    buttonSweets.yScale = 0.45;
    buttonSweets.zPosition = 11;
    buttonSweets.name = @"buttonSweets";
    [s addChild:buttonSweets];

}
+(void)touched: (SKNode *)but {
    [buttonAnimation changeState:but changeName:@"sweetStoreButtonPressed" originalName:@"sweetStoreButtonBetter"];
}
@end
