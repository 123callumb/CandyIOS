//
//  candyMachineSlotData.m
//  Candy
//
//  Created by Callum Beckwith on 05/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "candyMachineSlotData.h"
#import "candyMachines.h"

@implementation candyMachineSlotData
+(NSString*)getCandyMachineSlotDataAtID: (int)machineID slotID:(int)slotNumber {
    NSDictionary *machineData = [candyMachines getCandyMachineDataAtID:machineID];
    for(int i = 0; i <= 2; i++){
        if(slotNumber == i){
            return [machineData objectForKey:[NSString stringWithFormat:@"candyMachine_slot_%d", slotNumber]];
        }
    }
    return nil;
}
+(void)changeMachineSlotDataAtID:(int)machineID slotID:(int)slotNumber sweetTexture:(NSString*)sweetTexture {
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *machines = [candyMachines candyMachines];
    
    NSMutableDictionary *newData = [candyMachines getCandyMachineDataAtID:machineID];
    [newData setObject:sweetTexture forKey:[NSString stringWithFormat:@"candyMachine_slot_%d", slotNumber]];
    
    [machines replaceObjectAtIndex:machineID withObject:newData];
    
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:machines];
    
    [nd setObject:arrayToData forKey:@"candyMachineData"];
    [nd synchronize];
}
@end
