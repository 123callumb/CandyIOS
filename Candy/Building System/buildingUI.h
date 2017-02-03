//
//  buildingUI.h
//  Candy
//
//  Created by Callum Beckwith on 03/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface buildingUI : SKSpriteNode
+(void)createBuildingUI: (SKScene*)s;
+(void)onUpgTouch: (UIView*)v button:(SKSpriteNode*)node scene:(SKScene*)s;
@end
