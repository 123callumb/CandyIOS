//
//  buildingData.h
//  Candy
//
//  Created by Callum Beckwith on 15/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface buildingData : NSObject
+(void)addBuildingsToMap:(SKSpriteNode*)map;
+(NSArray*)buildingTypes;
+(NSArray*)getBuildingDisplayData;
+(NSMutableArray*)getBuidlingData;
+(NSString*)machineTextureForRank:(int)rank;
+(NSString*)getMachineTextureFromBuildingWithID:(int)buildingID  andMachineID:(int)machineID;
+(NSArray*)getMachineSlotUUIDSFromBuildingWithID:(int)buildingID andMachineID:(int)machineID;
+(void)upgradeMachineWithID:(int)machineID fromBuilding:(int)buildingID;
+(int)getMachineRankFromBuildingWithID:(int)buildingID andMachineID:(int)machineID;
+(int)getSlotsUnlockedAtMachineWithID:(int)machineID fromBuilding:(int)buildingID;
+(NSMutableDictionary*)getMachineDataWithID:(int)machineID fromBuilding:(int)buildingID;
+(void)changeMachineSlotValueFromBuilding:(int)buildingID andMachine:(int)machineID forSlot:(int)slotID andSweetUUID:(long)sweetUUID;
+(void)upgradeMachineSlotsWithID:(int)machineID fromBuilding:(int)buildingID;
@end
