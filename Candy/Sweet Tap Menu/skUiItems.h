//
//  skUiItems.h
//  Candy
//
//  Created by Callum Beckwith on 27/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface skUiItems : SKSpriteNode
+(void)addSkUI: (SKSpriteNode*)s;
+(void)onUpgTouch: (UIView*)v button:(SKSpriteNode*)node scene:(SKScene*)s;
@end
