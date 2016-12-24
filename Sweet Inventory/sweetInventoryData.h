//
//  sweetInventoryData.h
//  Candy
//
//  Created by Callum Beckwith on 20/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sweetInventoryData : NSObject
+(NSMutableArray*)getInventory;
+(void)addObject: (NSMutableDictionary*)sweetData;
+(NSMutableDictionary*)getSweetDataAtSlot: (int)slotID;
@end
