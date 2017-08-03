//
//  buildingType.m
//  Candy
//
//  Created by Callum Beckwith on 05/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "buildingType.h"

@implementation buildingType
+(void)addBuildingTypes: (NSMutableArray*)buildings {
    [self addBuildingData:buildings interiorTexture:@"building_house" buildingTexture:@"starterHouse" onScreenName:@"Old House" buildingPrice:[NSNumber numberWithInt:0]];
    [self addBuildingData:buildings interiorTexture:@"upgradedHouse_lvl_2" buildingTexture:@"house_lvl_3" onScreenName:@"New House" buildingPrice:[NSNumber numberWithInt:20000]];
    [self addBuildingData:buildings interiorTexture:@"upgradedHouse_lvl_1" buildingTexture:@"newHouse" onScreenName:@"Nice House" buildingPrice:[NSNumber numberWithInt:40000]];
    [self addBuildingData:buildings interiorTexture:@"upgradedHouse_lvl_3" buildingTexture:@"house_lvl_4" onScreenName:@"Big House" buildingPrice:[NSNumber numberWithInt:80000]];
    [self addBuildingData:buildings interiorTexture:@"upgradedHouse_lvl_2" buildingTexture:@"cityOffice_lvl_1" onScreenName:@"Small Office" buildingPrice:[NSNumber numberWithInt:160000]];
    [self addBuildingData:buildings interiorTexture:@"upgradedHouse_lvl_1" buildingTexture:@"cityOffice_lvl_2" onScreenName:@"Office" buildingPrice:[NSNumber numberWithInt:320000]];
    [self addBuildingData:buildings interiorTexture:@"upgradedHouse_lvl_3" buildingTexture:@"cityOffice_lvl_3" onScreenName:@"Large Office" buildingPrice:[NSNumber numberWithInt:640000]];
    [self addBuildingData:buildings interiorTexture:@"upgradedHouse_lvl_2" buildingTexture:@"factory_lvl_1" onScreenName:@"Small Factory" buildingPrice:[NSNumber numberWithInt:1200000]];
    [self addBuildingData:buildings interiorTexture:@"upgradedHouse_lvl_1" buildingTexture:@"factory_lvl_2" onScreenName:@"MOVE OUT!" buildingPrice:[NSNumber numberWithInt:2400000]];

}
+(NSArray*)getBuildingTypes {
    NSMutableArray *buildingType = [[NSMutableArray alloc] init];
    [self addBuildingTypes:buildingType];
    return buildingType;
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
+(void)addBuildingData:(NSMutableArray*)buildings interiorTexture:(NSString*)wallTexture buildingTexture:(NSString*)building onScreenName:(NSString*)name buildingPrice:(NSNumber*)price{
    NSMutableDictionary *buildingData = [[NSMutableDictionary alloc] init];
    [buildingData setObject:wallTexture forKey:@"building_wall"];
    [buildingData setObject:building forKey:@"building_texture"];
    [buildingData setObject:name forKey:@"building_name"];
    [buildingData setObject:price forKey:@"building_price"];
    [buildings addObject:buildingData];
}
+(NSString*)getCurrentBuildingWall {
    int buildingID = [self getCurrentBuildingID];
    NSMutableDictionary *buildingData = [[self getBuildingTypes] objectAtIndex:buildingID];
    NSString *wallTexture = [buildingData objectForKey:@"building_wall"];
    return wallTexture;
}

//Yes I realise that all of these can be placed in one method due to the fact they all return string values but I will get round to that when it's rewrite time :P

+(NSString*)getCurrentBuilding {
    int buildingID = [self getCurrentBuildingID];
    NSMutableDictionary *buildingData = [[self getBuildingTypes] objectAtIndex:buildingID];
    NSString *buildingTexture = [buildingData objectForKey:@"building_texture"];
    return buildingTexture;
}
+(NSString*)getCurrentBuildingName {
    int buildingID = [self getCurrentBuildingID];
    NSMutableDictionary *buildingData = [[self getBuildingTypes] objectAtIndex:buildingID];
    NSString *buildingName = [buildingData objectForKey:@"building_name"];
    return buildingName;
}
+(NSString*)getNextBuildingName {
    int buildingID = [self getCurrentBuildingID] + 1;
    
    if(buildingID <= [[self getBuildingTypes] count] - 1){
        NSMutableDictionary *buildingData = [[self getBuildingTypes] objectAtIndex:buildingID];
        NSString *buildingName = [buildingData objectForKey:@"building_name"];
        return buildingName;
    }
    return @"No Further Upgrades";

}
+(NSString*)getNextBuilding {
    int buildingID = [self getCurrentBuildingID] + 1;
    if(buildingID <= [[self getBuildingTypes] count] - 1){
        NSMutableDictionary *buildingData = [[self getBuildingTypes] objectAtIndex:buildingID];
        NSString *buildingName = [buildingData objectForKey:@"building_texture"];
        return buildingName;
    }
    return @"emptyDraw";
}

//Yes these will be in their own method aswell okayyyyy ;)

+(int)getNextBuildingPrice {
    int buildingID = [self getCurrentBuildingID] + 1;
    if(buildingID <= [[self getBuildingTypes] count] - 1){
        NSMutableDictionary *buildingData = [[self getBuildingTypes] objectAtIndex:buildingID];
        NSNumber *buildingPriceNS = [buildingData objectForKey:@"building_price"];
        int buildingPrice = [buildingPriceNS intValue];
        return buildingPrice;
    }
    return 0;
}
@end
