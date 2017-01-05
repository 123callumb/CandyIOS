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
    [floors addObject:@"disco_floor"];  //ID 1
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
@end
