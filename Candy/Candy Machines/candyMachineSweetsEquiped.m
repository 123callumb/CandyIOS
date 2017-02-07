//
//  candyMachineSweetsEquiped.m
//  Candy
//
//  Created by Callum Beckwith on 06/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "candyMachineSweetsEquiped.h"
#import "sweetInventoryData.h"
#import "candyMachines.h"

@implementation candyMachineSweetsEquiped
+(bool)hasAlreadyGotItemEquiped: (long)sweetUUID {
    for(int i = 0; i <= ([candyMachines getCandyMachinesUnlocked] - 1); i++){
        NSMutableDictionary *machineData = [candyMachines getCandyMachineDataAtID:i];
        NSNumber *slot1UUID = [machineData objectForKey:@"candyMachine_slot_0"];
        NSNumber *slot2UUID = [machineData objectForKey:@"candyMachine_slot_1"];
        NSNumber *slot3UUID = [machineData objectForKey:@"candyMachine_slot_2"];
        
        long slot1 = [slot1UUID longValue];
        long slot2 = [slot2UUID longValue];
        long slot3 = [slot3UUID longValue];
        
        if(sweetUUID == slot1 || sweetUUID == slot2 || sweetUUID == slot3){
            return true;
        }
    }
    return false;
}
@end
