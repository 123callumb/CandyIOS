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

+(NSMutableArray*)getPacketInventroyAsArray {
    NSMutableArray *packetArray;
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSData *arrayToData = [nd objectForKey:@"packetInventory"];
    
    if(arrayToData == nil){
        packetArray = [[NSMutableArray alloc] init];
        arrayToData = [[NSData alloc] init];
    }
    
    packetArray = [NSKeyedUnarchiver unarchiveObjectWithData:arrayToData];
    return packetArray;
}

+(void)addPacketWithStringToInventory: (NSString*)packetName {
    
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *pInv = [self getPacketInventroyAsArray];
    
    if(pInv == nil){
        pInv = [[NSMutableArray alloc] init];
    }
    
    [pInv addObject:packetName];
    
    // V I dont think this is needed but im too scared to take it out 0.o V I kind of think it is when i think about it... XD
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:pInv];
    
    [nd setObject:arrayToData forKey:@"packetInventory"];
    [nd synchronize];
    
}

+(NSString*)getPacketAtSlot: (int)slotID {
    
    NSMutableArray *pInv = [self getPacketInventroyAsArray];
    NSString *packetName = [pInv objectAtIndex:slotID];
    
    return packetName;
}
+(int)getSlotsFull {
    NSMutableArray *pInv = [self getPacketInventroyAsArray];
    return (int)([pInv count]);
}
+(void)removeFullSlot: (int)slotNo {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *pInv = [self getPacketInventroyAsArray];
    
    [pInv removeObjectAtIndex:slotNo];
    
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:pInv];
    
    [nd setObject:arrayToData forKey:@"packetInventory"];
    [nd synchronize];
}
@end
