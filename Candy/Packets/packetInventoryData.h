//
//  packetInventoryData.h
//  Candy
//
//  Created by Callum Beckwith on 12/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface packetInventoryData : UIView
+(void)fillSlot:(NSString*)packetTexture;
+(void)setSlotPacket: (NSString*)textureName slotNo:(int)slotNo;
+(NSString*)getSlotPacket: (int)slotNo;
+(void)setSlotFull:(int)slotNo;
+(void)setSlotEmpty:(int)slotNo;
+(bool)getSlotFull: (int)slotNo;
+(int)getSlotsFilled;
+(void)addNewFullSlot;
+(void)removeFullSlot;
@end
