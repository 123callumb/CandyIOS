//
//  candyMachineSlotData.h
//  Candy
//
//  Created by Callum Beckwith on 05/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface candyMachineSlotData : NSObject
+(long)getCandyMachineSlotUUIDAtID: (int)machineID slotID:(int)slotNumber;
+(void)changeMachineSlotDataAtID:(int)machineID slotID:(int)slotNumber sweetUUID:(NSNumber*)sweetUUID;
+(NSString*)getTextureFromSweetUUID: (long)sweetUUID;
@end
