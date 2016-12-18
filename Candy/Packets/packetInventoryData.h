//
//  packetInventoryData.h
//  Candy
//
//  Created by Callum Beckwith on 12/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface packetInventoryData : UIView

+(NSMutableArray*)getPacketInventroyAsArray;
+(void)addPacketWithStringToInventory: (NSString*)packetName;
+(NSString*)getPacketAtSlot: (int)slotID;
+(int)getSlotsFull;
+(void)removeFullSlot: (int)slotNo;
@end
