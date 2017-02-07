//
//  sweetUUID.m
//  Candy
//
//  Created by Callum Beckwith on 06/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "sweetUUID.h"
#import "sweetInventoryData.h"

@implementation sweetUUID
+(long)createNewSweetUUID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    long uUIDAmount = [nd integerForKey:@"sweet_uuids"];
    long newUUID = uUIDAmount + 1;
    [nd setInteger:newUUID forKey:@"sweet_uuids"];
    [nd synchronize];
    return newUUID;
}
+(int)getInventoryIdForSweetWithUUID: (long)sweetUUID {
    
    NSArray *sweetInventory = [sweetInventoryData getInventory];
    
    for(int i = 0; i <= [sweetInventory count] - 1; i++){
        NSDictionary *sweetInvItems = [sweetInventory objectAtIndex:i];
        NSNumber *sweetUUIDData = [sweetInvItems valueForKey:@"sweet_uuid"];
        long uuidSweet = [sweetUUIDData longValue];
        
        if(uuidSweet == sweetUUID){
                return i;
        }
    }
    return 0;
}
+(long)getUUIDForSweetWithInventoryID: (int)inventoryID {
    NSArray *sweetInventory = [sweetInventoryData getInventory];
    
    for(int i = 0; i <= [sweetInventory count] - 1; i++){
        if(i == inventoryID){
            NSDictionary *sweetInvItems = [sweetInventory objectAtIndex:i];
            NSNumber *sweetUUIDData = [sweetInvItems valueForKey:@"sweet_uuid"];
            long uuidSweet = [sweetUUIDData longValue];
            return uuidSweet;
        }
        
    }
    return  -1;
}
@end
