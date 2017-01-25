//
//  upgradeMenu.h
//  Candy
//
//  Created by Callum Beckwith on 15/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface upgradeMenu : SKSpriteNode
+(void)menuHandler: (SKScene*)s inScene:(bool)in;
+(void)SwitchingMenu:(SKScene*)s node:(SKNode*)n;
//+(void)onTouch:(SKNode*)n scene:(SKScene*)s;
@end
