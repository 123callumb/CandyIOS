//
//  candyMachines.h
//  Candy
//
//  Created by Killian Comerford on 02/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface candyMachines : SKSpriteNode
+(NSMutableArray*)candyMachines;
+(NSMutableDictionary*)getCandyMachineDataAtID: (int)candyMachineID;
+(int)getCandyMachineUpgradeValueAtID: (int)candyMachineID;
+(int)getCandyMachineSlotValueAtID: (int)candyMachineID;
+(int)getCandyMachinesUnlocked;
+(void)increaseCandyMachinesByOne;
+(void)upgradeMachineAtID:(int)machineID;
+(void)upgradeMachineSlotsAtID:(int)machineID;
@end
