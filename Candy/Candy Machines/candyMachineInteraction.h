//
//  candyMachineInteraction.h
//  Candy
//
//  Created by Callum Beckwith on 04/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface candyMachineInteraction : SKSpriteNode
+(void)onCandyMachineTouch: (SKSpriteNode*)machine scene:(SKScene*)s view:(UIView*)v;
+(void)animateAllCandyMachinesOnTap: (SKScene*)s;
+(int)getCurrentSelectedMachine;
+(void)resetCurrentSelectedMachine;
+(void)onBackButton: (SKSpriteNode*)s view:(UIView*)v;
@end
