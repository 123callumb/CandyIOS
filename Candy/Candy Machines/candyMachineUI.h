//
//  candyMachineUI.h
//  Candy
//
//  Created by Callum Beckwith on 05/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <UIKit/UIKit.h>
@interface candyMachineUI : SKSpriteNode
+(void)createCandyMachineUIWithID: (int)machineID scene:(SKScene*)s view:(UIView*)v;
+(int)getSelectedSlot;
+(void)resetSelectedSlot;
+(void)addCandyMachineSlotUIWithID: (int)machineID view:(UIView*)v;
+(void)onUpgradeMachine: (SKScene*)s machineID:(int)machineNumber node:(SKSpriteNode*)upg view:(UIView*)v;
@end
