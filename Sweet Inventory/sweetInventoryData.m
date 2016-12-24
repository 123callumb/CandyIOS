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
@end
