//
//  floors.m
//  Candy
//
//  Created by Callum Beckwith on 05/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//
//  So people should be a be to buy new floors to customise their base.

#import "floors.h"

@implementation floors
+(void)addFloors: (NSMutableArray*)floors {
    [floors addObject:@"floor_1"]; //ID 0 for when pulling from else where etc...
    [floors addObject:@"floor_blue"];  //ID 1
    [floors addObject:@"floor_red"];
    [floors addObject:@"floor_yellow"];
    [floors addObject:@"floor_green"];
    [floors addObject:@"floor_wood"];
    [floors addObject:@"floor_disco"];
    [floors addObject:@"floor_blackgold"];
    [floors addObject:@"floor_candycane"];
    [floors addObject:@"floor_checkered"];
    [floors addObject:@"floor_gold"];
    [floors addObject:@"floor_bonbonlover"];
}
+(NSArray*)getFloors {
    NSMutableArray *floors = [[NSMutableArray alloc] init];
    [self addFloors:floors];
    return floors;
}
+(NSString*)getCurrentFloor {
    int floorID = [self getCurrentFloorID];
    return [[self getFloors] objectAtIndex:floorID];
}
+(void)setCurrentFloorID: (int)floorID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:floorID forKey:@"floor_ID"];
    [nd synchronize];
}
+(int)getCurrentFloorID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd integerForKey:@"floor_ID"];
}
+(NSString*)getFloorAtIndex: (int)index {
    return [[self getFloors] objectAtIndex:index];
}
+(int)getAmountOfFloors {
    return (int)( [[self getFloors] count] - 1 );
}
+(NSMutableArray*)getOwnedFloorsByID {
    NSMutableArray *floorArray;
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSData *arrayToData = [nd objectForKey:@"ownedFloors"];
    
    if(arrayToData == nil){
        floorArray = [[NSMutableArray alloc] init];
        arrayToData = [[NSData alloc] init];
    }
    
    floorArray = [NSKeyedUnarchiver unarchiveObjectWithData:arrayToData];
    return floorArray;
}
+(void)addNewFloorToList: (int)floorID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *floors = [self getOwnedFloorsByID];
    
    if(floors == nil){
        floors = [[NSMutableArray alloc] init];
    }
    
    NSNumber *newFloor = [NSNumber numberWithInt:floorID];
    
    [floors addObject:newFloor];
    
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:floors];
    
    [nd setObject:arrayToData forKey:@"ownedFloors"];
    [nd synchronize];
}
+(bool)doesOwnFloor: (int)floorID {
    NSNumber *inputID = [NSNumber numberWithUnsignedInt:floorID];

    if([[self getOwnedFloorsByID] containsObject:inputID]){

        return true;
    }else {
        return false;
    }
}
@end
