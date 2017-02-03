//
//  menuButton.h
//  Candy
//
//  Created by Callum Beckwith on 03/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface menuButton : SKSpriteNode
+(void)onTouch: (SKSpriteNode*)obj scene:(SKScene*)s view:(UIView*)v;
+(void)reCreate: (SKScene*)s;
+(void)createCloseButton: (SKScene*)s;
+(void)onCloseButton: (SKSpriteNode*)obj scene:(SKScene*)s;
+(void)slideAwayMenu: (SKScene*)s ;
@end
