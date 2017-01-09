;//
//  buildingUpgradeUI.h
//  Candy
//
//  Created by Callum Beckwith on 08/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface buildingUpgradeUI : SKSpriteNode
+(void)createBuildingUI: (SKScene*)s;
+(void)onBackTouch: (UIView*)v button:(SKSpriteNode*)node scene:(SKScene*)s;
+(void)onUpgradeTouch: (UIView*)v button:(SKSpriteNode*)node scene:(SKScene*)s ;
+(void)removeMenu: (SKScene*)s;
@end
