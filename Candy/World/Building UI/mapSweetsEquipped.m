//
//  mapSweetsEquipped.m
//  Candy
//
//  Created by Callum Beckwith on 27/08/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "mapSweetsEquipped.h"
#import "buildingData.h"

NSArray *equippedSweets;

@implementation mapSweetsEquipped
+(bool)hasSweetEquippedToBuilding:(long)sweetUUID forBuilding:(int)buildingID {
    
    if (equippedSweets == nil) {
        [self updateAndLoadCurrentEquippedSweetsByUUID];
    }else {
        for (NSNumber *machineSweetUUIDS in [equippedSweets objectAtIndex:buildingID]) {
            
            if([machineSweetUUIDS longValue] == sweetUUID){
                return true;
            }
        }
        
        return false;
    }
    return false;
}
+(void)updateAndLoadCurrentEquippedSweetsByUUID {
    
    NSMutableArray *equippingSweets = [[NSMutableArray alloc] init];
    
    NSArray *worldData = [buildingData getBuidlingData];
    
    for (NSDictionary *building in worldData) {
        
        NSArray *buildingMachines = [building valueForKey:@"machineData"];
        NSMutableArray *buildingEquipped = [[NSMutableArray alloc] init];
        
        for(NSDictionary *machine in buildingMachines){
            for (int i = 1; i < 4; i++) {
                [buildingEquipped addObject:[machine valueForKey:[NSString stringWithFormat:@"slot%d", i]]];
            }
        }
        
        [equippingSweets addObject:buildingEquipped];
    }
    
    equippedSweets = [[NSArray alloc] initWithArray:equippingSweets];
}

+(NSArray*)getWorldEquippedSweets {
    return equippedSweets;
}
@end
