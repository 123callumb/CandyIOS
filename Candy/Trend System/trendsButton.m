//
//  trendsButton.m
//  Candy
//
//  Created by Callum Beckwith on 21/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "trendsButton.h"
#import "trendsMain.h"

@implementation trendsButton
+(void)createTrendsButton: (SKScene*)s {
    SKSpriteNode *bar = [SKSpriteNode spriteNodeWithImageNamed:@"trendsTopBar"];
    bar.position =CGPointMake(0, s.frame.size.height/2);
    bar.name = @"trendsButton";
    bar.xScale = 0.4;
    bar.yScale = 0.4;
    [s addChild:bar];
    
    SKAction *slideDown = [SKAction moveToY:bar.position.y - bar.frame.size.height*0.95 duration:0.1];
    [bar runAction:slideDown];
}
+(void)removeTrendsButton: (SKScene*)s {
    SKSpriteNode *trendBar = (SKSpriteNode*)[s childNodeWithName:@"trendsButton"];
    
    SKAction *slideUp = [SKAction moveToY:trendBar.position.y + trendBar.frame.size.height*0.95 duration:0.1];
    [trendBar runAction:slideUp completion:^{
        [trendBar removeFromParent];
    }];
}
+(void)onTrendBarTouch: (UIView*)v node:(SKSpriteNode*)button {
    if([button.name isEqualToString:@"trendsButton"]){
        [trendsMain createTrendsMenu:v];
    }
}
@end
