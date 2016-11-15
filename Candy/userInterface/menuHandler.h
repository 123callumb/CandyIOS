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
+(void)closeMenu:(SKScene*)s;
+(void)setCurrentMenu: (int)num;
@end
