//
//  sweetInventoryData.m
//  Candy
//
//  Created by Callum Beckwith on 20/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetInventoryData.h"

@implementation sweetInventoryData
+(NSMutableArray*)getInventory {
    
    NSMutableArray *invArray;
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSData *arrayToData = [nd objectForKey:@"sweetInventory"];
    
    if(arrayToData == nil){
        invArray = [[NSMutableArray alloc] init];
        arrayToData = [[NSData alloc] init];
    }
    
    invArray = [NSKeyedUnarchiver unarchiveObjectWithData:arrayToData];
    return invArray;
    
}
+(void)addObject: (NSMutableDictionary*)sweetData {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *inv = [self getInventory];
    
    if(inv == nil){
        inv = [[NSMutableArray alloc] init];
    }
    
    [inv addObject:sweetData];
    
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:inv];
    
    [nd setObject:arrayToData forKey:@"sweetInventory"];
    [nd synchronize];
    
}
+(NSMutableDictionary*)getSweetDataAtSlot: (int)slotID {
    NSMutableArray *invAray = [self getInventory];
    NSMutableDictionary *sweetData = [invAray objectAtIndex:slotID];
    return sweetData;
}
+(void)removeObject: (int)slotID {
    NSMutableArray *inv = [self getInventory];
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    
    if(inv == nil){
        inv = [[NSMutableArray alloc] init];
    }
    
    [inv removeObjectAtIndex:slotID];
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:inv];
    [nd setObject:arrayToData forKey:@"sweetInventory"];
    [nd synchronize];

}
+(int)rowAmount {
    int rows = 0;
    int highestSlotNo = (int)([[self getInventory] count]);
   
    for (int i = 0; i <= ([[self getInventory] count]); i++) {
        if(highestSlotNo == 0 || highestSlotNo == 1 || highestSlotNo == 2 || highestSlotNo == 3){
            return rows;
        }else {
            rows++;
            highestSlotNo = highestSlotNo - 4;
        }
    }
    
    return 0;
}
@end
