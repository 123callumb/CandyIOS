//
//  candyMachineSlotData.h
//  Candy
//
//  Created by Callum Beckwith on 05/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface candyMachineSlotData : NSObject
+(NSString*)getCandyMachineSlotDataAtID: (int)machineID slotID:(int)slotNumber;
+(void)changeMachineSlotDataAtID:(int)machineID slotID:(int)slotNumber sweetTexture:(NSString*)sweetTexture;
@end
