//
//  packetInventoryData.m
//  Candy
//
//  Created by Callum Beckwith on 12/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "packetInventoryData.h"
#import "packetInventroySlot.h"

@implementation packetInventoryData
+(void)fillSlot:(NSString*)packetTexture{
    int slotNo = [self getSlotsFilled] + 1;
    [self setSlotPacket:packetTexture slotNo:slotNo];
    [self setSlotFull:slotNo];
    [self addNewFullSlot];
}
+(void)setSlotPacket: (NSString*)textureName slotNo:(int)slotNo{
    [[NSUserDefaults standardUserDefaults] setValue:textureName forKey:[NSString stringWithFormat:@"packet_slot_%d", slotNo]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(NSString*)getSlotPacket: (int)slotNo {
    return [[NSUserDefaults standardUserDefaults] valueForKey:[NSString stringWithFormat:@"packet_slot_%d", slotNo]];
}
+(void)setSlotFull:(int)slotNo {
    [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:[NSString stringWithFormat:@"packet_slot_full_%d", slotNo]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)setSlotEmpty:(int)slotNo {
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:[NSString stringWithFormat:@"packet_slot_full_%d", slotNo]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(bool)getSlotFull: (int)slotNo {
    if ([[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"packet_slot_full_%d", slotNo]] == 1) {
        return true;
    }else {
        return false;
    }
}
+(int)getSlotsFilled   {
    return (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"packet_slots"];
}
+(void)addNewFullSlot {
    [[NSUserDefaults standardUserDefaults] setInteger:([self getSlotsFilled]+1) forKey:@"packet_slots"];
}
+(void)removeFullSlot {
    [[NSUserDefaults standardUserDefaults] setInteger:([self getSlotsFilled]-1) forKey:@"packet_slots"];
}
@end
