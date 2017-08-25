//
//  buildingData.m
//  Candy
//
//  Created by Callum Beckwith on 15/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "buildingData.h"
#import "candyMachines.h"
#import "candyMachineSlotData.h"

@implementation buildingData

int buildingCount = 8;

+(void)addBuildingsToMap:(SKSpriteNode*)map {
    
    for(int i = 0; i < buildingCount; i++){
        
        NSString *buildingTexture = [[[self buildingTypes] objectAtIndex:[[[self getBuildingDisplayData] objectAtIndex:i] intValue]] objectForKey:@"texture"];
        
        SKSpriteNode *building = [SKSpriteNode spriteNodeWithImageNamed:buildingTexture];
        [building setPosition:[self getBuildingPositionById:i forFrame:map.frame]];
        [building setScale:0.3];
        [building setName:[NSString stringWithFormat:@"building_%d", i]];
        [map addChild:building];
    }
}

+(CGPoint)getBuildingPositionById:(int)idNumber forFrame:(CGRect)rect {
    
    NSArray *housePositions = [[NSArray alloc] initWithObjects:
                               [NSValue valueWithCGPoint:CGPointMake(rect.size.width/4, rect.size.height/6)],
                               [NSValue valueWithCGPoint:CGPointMake(-rect.size.width/3.5, rect.size.height/6)],
                               [NSValue valueWithCGPoint:CGPointMake(rect.size.width/4, -rect.size.height/3.5)],
                               [NSValue valueWithCGPoint:CGPointMake(-rect.size.width/4, -rect.size.height/3.5)],
                               [NSValue valueWithCGPoint:CGPointMake(-rect.size.width/8, rect.size.height/2.4)],
                               [NSValue valueWithCGPoint:CGPointMake(rect.size.width/8, rect.size.height/3)],
                               [NSValue valueWithCGPoint:CGPointMake(-rect.size.width/12, -rect.size.height/20)],
                               [NSValue valueWithCGPoint:CGPointMake(0, -rect.size.height/2.2)],
                               nil];
    
    return [[housePositions objectAtIndex:idNumber] CGPointValue];
}
+(NSArray*)buildingTypes {
    return [[NSArray alloc] initWithObjects:
            [self createBuildingDataTypeWithTexture:@"padlock" price:[NSNumber numberWithInt:1000000] machines:[NSNumber numberWithInt:0]],
            [self createBuildingDataTypeWithTexture:@"starterHouse" price:[NSNumber numberWithInt:10000] machines:[NSNumber numberWithInt:1]],
            [self createBuildingDataTypeWithTexture:@"house_lvl_4" price:[NSNumber numberWithInt:40000] machines:[NSNumber numberWithInt:2]],
            [self createBuildingDataTypeWithTexture:@"cityOffice_lvl_1" price:[NSNumber numberWithInt:100000] machines:[NSNumber numberWithInt:3]],
            [self createBuildingDataTypeWithTexture:@"cityOffice_lvl_2" price:[NSNumber numberWithInt:200000] machines:[NSNumber numberWithInt:4]],
            [self createBuildingDataTypeWithTexture:@"cityOffice_lvl_3" price:[NSNumber numberWithInt:500000] machines:[NSNumber numberWithInt:5]],
            [self createBuildingDataTypeWithTexture:@"factory_lvl_1" price:[NSNumber numberWithInt:1000000] machines:[NSNumber numberWithInt:6]],
            [self createBuildingDataTypeWithTexture:@"factory_lvl_2" price:[NSNumber numberWithInt:2000000] machines:[NSNumber numberWithInt:7]],
            [self createBuildingDataTypeWithTexture:@"factory_lvl_3" price:[NSNumber numberWithInt:4000000] machines:[NSNumber numberWithInt:8]]
            , nil];
}
+(NSDictionary*)createBuildingDataTypeWithTexture:(NSString*)texture price:(NSNumber*)price machines:(NSNumber*)machines {
    return [NSDictionary dictionaryWithObjectsAndKeys:texture, @"texture", price, @"price", machines, @"machines", nil];
}
//Define rank of buildigs const properties e.g. the price never changes the texture doesnt and neither do the amount of machines it has
+(NSArray*)getBuildingDisplayData {
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSData *buildingDisplayData = [nd objectForKey:@"buildingDisplayData"];
    
    if(buildingDisplayData == nil){
        NSArray *buildingDisplayList = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:8],
                                                                        [NSNumber numberWithInt:0],
                                                                        [NSNumber numberWithInt:0],
                                                                        [NSNumber numberWithInt:0],
                                                                        [NSNumber numberWithInt:0],
                                                                        [NSNumber numberWithInt:0],
                                                                        [NSNumber numberWithInt:0],
                                                                        [NSNumber numberWithInt:0],nil];
        
        NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:buildingDisplayList];
        [nd setObject:arrayToData forKey:@"buildingDisplayData"];
        
        NSData *newData = [nd objectForKey:@"buildingDisplayData"];
        NSArray *newDisplay = [NSKeyedUnarchiver unarchiveObjectWithData:newData];
        
        return newDisplay;
        
    }else {
    
        NSArray *buildingDisplay = [NSKeyedUnarchiver unarchiveObjectWithData:buildingDisplayData];
        return buildingDisplay;
        
    }
    
}

+(NSMutableArray*)getBuidlingData {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSData *buildingData = [nd objectForKey:@"buildingData"];
    
    if(buildingData == nil){
        NSMutableArray *buildingList = [[NSMutableArray alloc] init];
        
        for(int i = 0;i < 8; i++){
            [buildingList addObject:[self createDefaultBuildingSettings]];
        }
        
        //Set the first object in the list, which is classed as the first building becuase it needs to take the machine data from the previous scene
        NSMutableArray *oldMachineData = [[NSMutableArray alloc] init];
       
        //Fill machines up with old slot data :P
        for(int i = 0; i < 8; i++){
            NSNumber *machineRank = [NSNumber numberWithInt:[candyMachines getCandyMachineUpgradeValueAtID:i] + 1];
            NSNumber *slot1UUID = [NSNumber numberWithLong:[candyMachineSlotData getCandyMachineSlotUUIDAtID:i slotID:0]];
            NSNumber *slot2UUID = [NSNumber numberWithLong:[candyMachineSlotData getCandyMachineSlotUUIDAtID:i slotID:1]];
            NSNumber *slot3UUID = [NSNumber numberWithLong:[candyMachineSlotData getCandyMachineSlotUUIDAtID:i slotID:2]];
            NSNumber *slotRank = [NSNumber numberWithInt:[candyMachines getCandyMachineSlotValueAtID:i]];
            NSMutableDictionary *machineData = [NSMutableDictionary dictionaryWithObjectsAndKeys:machineRank, @"rank",
                                                                                                 slotRank, @"slotRank",
                                                                                                 slot1UUID, @"slot1",
                                                                                                 slot2UUID, @"slot2",
                                                                                                 slot3UUID, @"slot3",
                                                                                                nil];
            [oldMachineData addObject:machineData];
        }
        
        NSMutableDictionary *oldBuildingData = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:7], @"machineCount", oldMachineData, @"machineData", nil];
        
        [buildingList replaceObjectAtIndex:0 withObject:oldBuildingData];
        
        NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:buildingList];
        [nd setObject:arrayToData forKey:@"buildingData"];
        
        NSData *newData = [nd objectForKey:@"buildingData"];
        NSMutableArray *newBuildings = [NSKeyedUnarchiver unarchiveObjectWithData:newData];
        
        return newBuildings;
        
    }else {
        
        NSMutableArray *buildings = [NSKeyedUnarchiver unarchiveObjectWithData:buildingData];
        return buildings;
        
    }
}

+(NSMutableDictionary*)createDefaultBuildingSettings {
    NSMutableArray *machineData = [[NSMutableArray alloc] init];
    for(int i = 0; i < 8; i++){
        [machineData addObject:[self createDefaultMachineSettings]];
    }
    
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0], @"machineCount", machineData, @"machineData", nil];
}
+(NSMutableDictionary*)createDefaultMachineSettings {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:0], @"rank", [NSNumber numberWithInt:0], @"slotRank", nil, @"slot1", nil, @"slot2", nil, @"slot3", nil];
}
+(NSString*)machineTextureForRank:(int)rank {
    NSArray *machineTextures = [[NSArray alloc] initWithObjects:@"padlock", @"machine_default", @"machine_2", @"machine_3", @"machine_5", nil];
    return [machineTextures objectAtIndex:rank];
}
+(int)getMachineRankFromBuildingWithID:(int)buildingID andMachineID:(int)machineID {
    NSDictionary *buildingDataObject = [[self getBuidlingData] objectAtIndex:buildingID];
    NSArray *machines = [buildingDataObject valueForKey:@"machineData"];
    NSDictionary *machineData = [machines objectAtIndex:machineID];
    NSNumber *machineRank = [machineData objectForKey:@"rank"];
    return [machineRank intValue];
}
+(NSString*)getMachineTextureFromBuildingWithID:(int)buildingID andMachineID:(int)machineID {
    NSDictionary *buildingDataObject = [[self getBuidlingData] objectAtIndex:buildingID];
    NSArray *machines = [buildingDataObject valueForKey:@"machineData"];
    NSDictionary *machineData = [machines objectAtIndex:machineID];
    NSNumber *machineRank = [machineData objectForKey:@"rank"];
    NSString *machineTexture = [buildingData machineTextureForRank:[machineRank intValue]];
    return machineTexture;
}
+(NSArray*)getMachineSlotUUIDSFromBuildingWithID:(int)buildingID andMachineID:(int)machineID {
    NSArray *buildingData = [[self getBuidlingData] objectAtIndex:buildingID];
    NSArray *machines = [buildingData valueForKey:@"machineData"];
    NSDictionary *machineData = [machines objectAtIndex:machineID];
    return [[NSArray alloc] initWithObjects:
                                [machineData objectForKey:@"slot1"],
                                [machineData objectForKey:@"slot2"],
                                [machineData objectForKey:@"slot3"],
              nil];
}
+(NSMutableDictionary*)getMachineDataWithID:(int)machineID fromBuilding:(int)buildingID {
    NSMutableArray *buildings = (NSMutableArray*)[self getBuidlingData];
    NSMutableDictionary *building = [buildings objectAtIndex:buildingID];
    NSMutableArray *machines = [building valueForKey:@"machineData"];
    NSMutableDictionary *machineData = [machines objectAtIndex:machineID];
    return machineData;
}
+(void)upgradeMachineWithID:(int)machineID fromBuilding:(int)buildingID {
    
    NSMutableArray *buildings = (NSMutableArray*)[self getBuidlingData];
    NSMutableDictionary *building = [buildings objectAtIndex:buildingID];
    NSMutableArray *machines = [building valueForKey:@"machineData"];
    NSMutableDictionary *machineData = [machines objectAtIndex:machineID];
    
    int newMachineRank = [[machineData objectForKey:@"rank"] intValue] + 1;
    
    NSMutableDictionary *newMachineData = [machineData mutableCopy];
    
    [newMachineData removeObjectForKey:@"rank"];
    [newMachineData setObject:[NSNumber numberWithInt:newMachineRank] forKey:@"rank"];
    
    NSMutableArray *newMachines = [machines mutableCopy];
    
    [newMachines replaceObjectAtIndex:machineID withObject:newMachineData];
    
    NSMutableDictionary *newBuilding = [building mutableCopy];
    
    [newBuilding removeObjectForKey:@"machineData"];
    [newBuilding setObject:newMachines forKey:@"machineData"];
    
    [buildings replaceObjectAtIndex:buildingID withObject:newBuilding];
    
    [self updateBuildingData:buildings];
    
}
+(int)getSlotsUnlockedAtMachineWithID:(int)machineID fromBuilding:(int)buildingID {
    NSDictionary *machineData = [self getMachineDataWithID:machineID fromBuilding:buildingID];
    return [[machineData objectForKey:@"slotRank"] intValue];
}
+(void)updateBuildingData:(NSArray*)newBuildingData {
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:newBuildingData];
    [nd setObject:arrayToData forKey:@"buildingData"];
    
}
@end
