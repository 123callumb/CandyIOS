//
//  optimiseCandyMachineData.m
//  Candy
//
//  Created by Callum Beckwith on 12/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "optimiseCandyMachineData.h"
#import "candyMachines.h"
#import "candyMachineSlotData.h"

@implementation optimiseCandyMachineData
+(void)resetSlotArray {
    NSMutableArray *allSlotTextures = [[NSMutableArray alloc] init];
    
    for (int i = 0; i <= [candyMachines getCandyMachinesUnlocked]-1; i++) {
        
        for(int slotNo = 0; slotNo <= 2; slotNo++){
            long slotUUID = [candyMachineSlotData getCandyMachineSlotUUIDAtID:i slotID:slotNo];
            NSString *textureForSlot = [candyMachineSlotData getTextureFromSweetUUID:slotUUID];
            [allSlotTextures addObject:textureForSlot];
        }

    }
    
    NSData *arayToData = [NSKeyedArchiver archivedDataWithRootObject:allSlotTextures];
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setObject:arayToData forKey:@"currentSlotData"];
    [nd synchronize];
}
+(NSMutableArray*)getCurrentSlotState {
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSData *slotdata = [nd objectForKey:@"currentSlotData"];
    
    NSMutableArray *slotTextures = [[NSMutableArray alloc] init];
    
    slotTextures = [NSKeyedUnarchiver unarchiveObjectWithData:slotdata];
    return slotTextures;
}
+(NSString*)returnTextureAtMachineID:(int)machineID slotNumber:(int)slotID {
    int machineNumber = 3 * machineID;
    NSString *texture = [[self getCurrentSlotState] objectAtIndex:(machineNumber + slotID)];
    return texture;
}
+(void)testArray {
    for (int i = 0; i <= [candyMachines getCandyMachinesUnlocked]-1; i++) {
        
        for(int slotNo = 0; slotNo <= 2; slotNo++){
            NSLog(@"%@", [self returnTextureAtMachineID:i slotNumber:slotNo]);
        }
    }
}
@end
