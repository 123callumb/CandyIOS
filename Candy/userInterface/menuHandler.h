//
//  menuHandler.h
//  Candy
//
//  Created by Callum Beckwith on 07/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface menuHandler : SKSpriteNode
+(void)menuRemover:(SKScene*)s;
+(void)menuBringBacker:(SKScene*)s;
+(void)closeMenu:(SKScene*)s view:(UIView*)v;
+(void)setCurrentMenu: (int)num;
+(int)getCurrentMenu;
+(void)refreshMenuSystem: (SKScene*)s;
+(void)addTopButtons:(SKScene*)s;
@end
