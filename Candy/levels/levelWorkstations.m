//
//  levelWorkstations.m
//  Candy
//
//  Created by Callum Beckwith on 05/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "levelWorkstations.h"
#import "candyMachines.h"
#import "buildingType.h"

@implementation levelWorkstations
+(void)addWorkstationTypes: (NSMutableArray*)workstations {
    [workstations addObject:@"workstation_box"]; //ID 0 for when pulling from else where etc...
    [workstations addObject:@"nice_desk"];  //ID 1
}
+(NSArray*)getWorkstationTypes {
    NSMutableArray *workstationTypes = [[NSMutableArray alloc] init];
    [self addWorkstationTypes:workstationTypes];
    return workstationTypes;
}
+(NSString*)getCurrentWorkstation {
    int workstationID = [self getCurrentWorkstationID];
    return [[self getWorkstationTypes] objectAtIndex:workstationID];
}
+(void)setCurrentWorkstationID: (int)buildingID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:buildingID forKey:@"workstation_ID"];
    [nd synchronize];
}
+(int)getCurrentWorkstationID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd integerForKey:@"workstation_ID"];
}
+(void)workstation: (CGPoint)pos scale:(float)scale nodeToAttatch:(SKSpriteNode*)s stationID:(int)workstationID {
    SKSpriteNode *workstation = [SKSpriteNode spriteNodeWithImageNamed:[self getCurrentWorkstation]];
    workstation.xScale = scale;
    workstation.yScale = scale;
    workstation.position = pos;
    workstation.anchorPoint = CGPointMake(0.5, 0.5);
    
    //We take 1 here because we have to take into account the one on the desk!
    if([self getUsableWorkstations] - 1 >= workstationID){
        workstation.name = @"workstation";
        [candyMachines addCandyMachine:workstation scale:0.8 position:CGPointMake(0, workstation.frame.size.height/1.2)];
    }
    
    [s addChild:workstation];
}
+(void)addWorkstations: (SKSpriteNode*)s {
    if([buildingType getCurrentBuildingID] == 0){
        [self workstation:CGPointMake(s.frame.size.width/4, s.frame.size.height/12) scale:0.9 nodeToAttatch:s stationID:0];
        [self workstation:CGPointMake(-s.frame.size.width/4, s.frame.size.height/12) scale:0.9 nodeToAttatch:s stationID:1];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/4) scale:0.9 nodeToAttatch:s stationID:2];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/4) scale:0.9 nodeToAttatch:s stationID:3];
    }
}
+(void)setUsableWorkstationAmount: (int)value {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:value forKey:@"workstation_active"];
    [nd synchronize];
}
+(int)getUsableWorkstations {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    return (int)[nd integerForKey:@"workstation_active"];
}
@end