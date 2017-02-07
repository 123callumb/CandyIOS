//
//  candyMachines.m
//  Candy
//
//  Created by Killian Comerford on 02/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//


// Variables of a Candy Machine
// || Candy Machine Number || Slot Amount || Slot Prices || Upgrade Value (will determine Texture)|| Upgrade Prices ||
#import "candyMachines.h"
#import "determineSweetTap.h"
#import "candyMachineSlotData.h"

@implementation candyMachines

//Initialise all the Candy Machine Data

+(NSMutableArray*)candyMachines {
    NSMutableArray *machineArray;
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSData *arrayToData = [nd objectForKey:@"candyMachineData"];
    
    if(arrayToData == nil){
        machineArray = [[NSMutableArray alloc] init];
        arrayToData = [[NSData alloc] init];
    }
    
    machineArray = [NSKeyedUnarchiver unarchiveObjectWithData:arrayToData];
    return machineArray;
    
}
+(void)addNewMachineToList: (NSMutableDictionary*)machineData {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *machines = [self candyMachines];
    
    if(machines == nil){
        machines = [[NSMutableArray alloc] init];
    }
    
    [machines addObject:machineData];
    
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:machines];
    
    [nd setObject:arrayToData forKey:@"candyMachineData"];
    [nd synchronize];
}
+(NSMutableDictionary*)createMachineData {
    NSMutableDictionary *candyMachineData = [[NSMutableDictionary alloc] init];
    [candyMachineData setObject:[NSNumber numberWithInt:0] forKey:@"candyMachine_upgradeValue"];
    [candyMachineData setObject:[NSNumber numberWithInt:0] forKey:@"candyMachine_slotValue"];
    [candyMachineData setObject:[NSNumber numberWithLong:-1] forKey:@"candyMachine_slot_0"];
    [candyMachineData setObject:[NSNumber numberWithLong:-1] forKey:@"candyMachine_slot_1"];
    [candyMachineData setObject:[NSNumber numberWithLong:-1] forKey:@"candyMachine_slot_2"];
    return candyMachineData;
}
+(void)increaseCandyMachinesByOne {
    [self addNewMachineToList:[self createMachineData]];
}

//Pull Candy Machine Data By ID

+(NSMutableDictionary*)getCandyMachineDataAtID: (int)candyMachineID {
    NSMutableArray *machines = [self candyMachines];
    NSMutableDictionary *machineData = [machines objectAtIndex:candyMachineID];
    return machineData;
}

+(int)getCandyMachineUpgradeValueAtID: (int)candyMachineID {
    NSNumber *upgValue = [[self getCandyMachineDataAtID:candyMachineID] objectForKey:@"candyMachine_upgradeValue"];
    int value = [upgValue intValue];
    return value;
}
+(int)getCandyMachineSlotValueAtID: (int)candyMachineID {
    NSNumber *slotValue = [[self getCandyMachineDataAtID:candyMachineID] objectForKey:@"candyMachine_slotValue"];
    int value = [slotValue intValue];
    return value;
}


+(int)getCandyMachinesUnlocked {
    return (int)([[self candyMachines] count]);
}

@end
