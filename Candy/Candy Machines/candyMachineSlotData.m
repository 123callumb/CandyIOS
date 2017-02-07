//
//  candyMachineSlotData.m
//  Candy
//
//  Created by Callum Beckwith on 05/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "candyMachineSlotData.h"
#import "candyMachines.h"
#import "sweetInventoryData.h"

@implementation candyMachineSlotData
+(long)getCandyMachineSlotUUIDAtID: (int)machineID slotID:(int)slotNumber {
    NSDictionary *machineData = [candyMachines getCandyMachineDataAtID:machineID];
    for(int i = 0; i <= 2; i++){
        if(slotNumber == i){
            long uuid = [[machineData objectForKey:[NSString stringWithFormat:@"candyMachine_slot_%d", slotNumber]] longValue];
            return uuid;
        }
    }
    return -1;
}
+(void)changeMachineSlotDataAtID:(int)machineID slotID:(int)slotNumber sweetUUID:(NSNumber*)sweetUUID {
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *machines = [candyMachines candyMachines];
    
    NSMutableDictionary *newData = [candyMachines getCandyMachineDataAtID:machineID];
    [newData setObject:sweetUUID forKey:[NSString stringWithFormat:@"candyMachine_slot_%d", slotNumber]];
    
    [machines replaceObjectAtIndex:machineID withObject:newData];
    
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:machines];
    
    [nd setObject:arrayToData forKey:@"candyMachineData"];
    [nd synchronize];
}
+(NSString*)getTextureFromSweetUUID: (long)sweetUUID {
    for(int i = 0; i <= ([[sweetInventoryData getInventory] count] - 1); i++){
        NSMutableDictionary *sweetInventory  = [sweetInventoryData getSweetDataAtSlot:i];
        NSNumber *nsUUID = [sweetInventory valueForKey:@"sweet_uuid"];
        long uUID = [nsUUID longValue];
        
        if(uUID == sweetUUID){
            return [sweetInventory valueForKey:@"sweet_texture"];
        }
        
        if(sweetUUID == -1){
            return @"emptyDraw";
        }
        
    }
    return @"emptyDraw";
}
@end
