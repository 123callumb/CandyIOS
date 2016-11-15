//
//  inventoryMenu.h
//  Candy
//
//  Created by Callum Beckwith on 07/11/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface inventoryMenu : SKSpriteNode
+(void)menuActions: (SKScene *)s inScene:(bool)in;
+(void)createMenu: (SKScene *)s node:(SKSpriteNode *)main;
+(void)removeMenu: (SKScene *)s;
@end
