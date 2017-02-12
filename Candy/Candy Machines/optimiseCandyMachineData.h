//
//  optimiseCandyMachineData.h
//  Candy
//
//  Created by Callum Beckwith on 12/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface optimiseCandyMachineData : NSObject
+(void)resetSlotArray;
+(NSString*)returnTextureAtMachineID:(int)machineID slotNumber:(int)slotID;
+(void)testArray;
@end
