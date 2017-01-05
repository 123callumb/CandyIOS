//
//  buildingType.m
//  Candy
//
//  Created by Callum Beckwith on 05/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "buildingType.h"

@implementation buildingType
+(void)addBuildingTypes: (NSMutableArray*)floors {
    [floors addObject:@"building_house"]; //ID 0 for when pulling from else where etc...
    [floors addObject:@"wall_lvl_2"];  //ID 1
}
+(NSArray*)getBuildingTypes {
    NSMutableArray *buildingType = [[NSMutableArray alloc] init];
    [self addBuildingTypes:buildingType];
    return buildingType;
}
+(NSString*)getCurrentBuilding {
    int buildingID = [self getCurrentBuildingID];
    return [[self getBuildingTypes] objectAtIndex:buildingID];
}
+(void)setCurrentBuildingID: (int)buildingID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:buildingID forKey:@"building_ID"];
    [nd synchronize];
}
+(int)getCurrentBuildingID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd integerForKey:@"building_ID"];
}
@end
