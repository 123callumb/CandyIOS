//
//  levelWorkstations.m
//  Candy
//
//  Created by Callum Beckwith on 05/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "levelWorkstations.h"
#import "candyMachineCreator.h"
#import "buildingType.h"
#import "candyMachines.h"

@implementation levelWorkstations
+(void)addWorkstationTypes: (NSMutableArray*)workstations {
    [workstations addObject:@"workstation_box"]; //ID 0 for when pulling from else where etc...
    [workstations addObject:@"workstation_wood"];  //ID 1
    [workstations addObject:@"workstation_cloudedGlass"];
    [workstations addObject:@"workstation_grey"];
    [workstations addObject:@"workstation_colours"];
    [workstations addObject:@"workstation_tetris"];
    [workstations addObject:@"workstation_meme"];
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
+(void)workstation: (CGPoint)pos scale:(float)scale nodeToAttatch:(SKScene*)s stationID:(int)workstationID {
    SKSpriteNode *workstation = [SKSpriteNode spriteNodeWithImageNamed:[self getCurrentWorkstation]];
    [candyMachineCreator createCandyMachineWithID:workstationID position:pos scale:scale attatchingSprite:workstation];
    workstation.position = pos;
    workstation.anchorPoint = CGPointMake(0.5, 0.5);
    workstation.xScale = scale;
    workstation.yScale = scale;

    
    //We take 1 here because we have to take into account the one on the desk!
    workstation.name = [NSString stringWithFormat:@"workstation_%d", workstationID];


    
    [s addChild:workstation];
}
+(void)addWorkstations: (SKScene*)s {
    if([buildingType getCurrentBuildingID] == 0){
        [self workstation:CGPointMake(0, -s.frame.size.height/5) scale:1 nodeToAttatch:s stationID:0];
    }
    if([buildingType getCurrentBuildingID] == 1){
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/6) scale:1 nodeToAttatch:s stationID:0];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/6) scale:1 nodeToAttatch:s stationID:1];
    }
    if([buildingType getCurrentBuildingID] == 2){
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/8) scale:0.9 nodeToAttatch:s stationID:0];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/8) scale:0.9 nodeToAttatch:s stationID:1];
        [self workstation:CGPointMake(0, -s.frame.size.height/2.6) scale:0.9 nodeToAttatch:s stationID:2];
    }
    if([buildingType getCurrentBuildingID] == 3){
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/8) scale:0.9 nodeToAttatch:s stationID:0];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/8) scale:0.9 nodeToAttatch:s stationID:1];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/2.6) scale:0.9 nodeToAttatch:s stationID:2];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/2.6) scale:0.9 nodeToAttatch:s stationID:3];
    }
    if([buildingType getCurrentBuildingID] == 4){
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/22) scale:0.8 nodeToAttatch:s stationID:0];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/22) scale:0.8 nodeToAttatch:s stationID:1];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/4.3) scale:0.8 nodeToAttatch:s stationID:2];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/4.3) scale:0.8 nodeToAttatch:s stationID:3];
        [self workstation:CGPointMake(0, -s.frame.size.height/2.35) scale:0.8 nodeToAttatch:s stationID:4];

    }
    if([buildingType getCurrentBuildingID] == 5){
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/22) scale:0.8 nodeToAttatch:s stationID:0];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/22) scale:0.8 nodeToAttatch:s stationID:1];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/4.3) scale:0.8 nodeToAttatch:s stationID:2];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/4.3) scale:0.8 nodeToAttatch:s stationID:3];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/2.35) scale:0.8 nodeToAttatch:s stationID:4];
        [self workstation:CGPointMake(-s.frame.size.width/4,  -s.frame.size.height/2.35) scale:0.8 nodeToAttatch:s stationID:5];
    }
    if([buildingType getCurrentBuildingID] == 6){
        [self workstation:CGPointMake(s.frame.size.width/4, s.frame.size.height/40) scale:0.7 nodeToAttatch:s stationID:0];
        [self workstation:CGPointMake(-s.frame.size.width/4, s.frame.size.height/40) scale:0.7 nodeToAttatch:s stationID:1];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/8) scale:0.7 nodeToAttatch:s stationID:2];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/8) scale:0.7 nodeToAttatch:s stationID:3];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/3.6) scale:0.7 nodeToAttatch:s stationID:4];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/3.6) scale:0.7 nodeToAttatch:s stationID:5];
        [self workstation:CGPointMake(0, -s.frame.size.height/2.3) scale:0.7 nodeToAttatch:s stationID:6];
    }
    if([buildingType getCurrentBuildingID] == 7){
        [self workstation:CGPointMake(s.frame.size.width/4, s.frame.size.height/40) scale:0.7 nodeToAttatch:s stationID:0];
        [self workstation:CGPointMake(-s.frame.size.width/4, s.frame.size.height/40) scale:0.7 nodeToAttatch:s stationID:1];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/8) scale:0.7 nodeToAttatch:s stationID:2];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/8) scale:0.7 nodeToAttatch:s stationID:3];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/3.6) scale:0.7 nodeToAttatch:s stationID:4];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/3.6) scale:0.7 nodeToAttatch:s stationID:5];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/2.3) scale:0.7 nodeToAttatch:s stationID:6];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/2.3) scale:0.7 nodeToAttatch:s stationID:7];
    }
    if([buildingType getCurrentBuildingID] == 8){
        [self workstation:CGPointMake(s.frame.size.width/4, s.frame.size.height/15) scale:0.6 nodeToAttatch:s stationID:0];
        [self workstation:CGPointMake(-s.frame.size.width/4, s.frame.size.height/15) scale:0.6 nodeToAttatch:s stationID:1];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/20) scale:0.6 nodeToAttatch:s stationID:2];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/20) scale:0.6 nodeToAttatch:s stationID:3];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/5.9) scale:0.6 nodeToAttatch:s stationID:4];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/5.9) scale:0.6 nodeToAttatch:s stationID:5];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/3.4) scale:0.6 nodeToAttatch:s stationID:6];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/3.4) scale:0.6 nodeToAttatch:s stationID:7];
        [self workstation:CGPointMake(0, -s.frame.size.height/2.4) scale:0.6 nodeToAttatch:s stationID:8];
    }
    if([buildingType getCurrentBuildingID] == 9){
        [self workstation:CGPointMake(s.frame.size.width/4, s.frame.size.height/15) scale:0.6 nodeToAttatch:s stationID:0];
        [self workstation:CGPointMake(-s.frame.size.width/4, s.frame.size.height/15) scale:0.6 nodeToAttatch:s stationID:1];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/20) scale:0.6 nodeToAttatch:s stationID:2];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/20) scale:0.6 nodeToAttatch:s stationID:3];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/5.9) scale:0.6 nodeToAttatch:s stationID:4];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/5.9) scale:0.6 nodeToAttatch:s stationID:5];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/3.4) scale:0.6 nodeToAttatch:s stationID:6];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/3.4) scale:0.6 nodeToAttatch:s stationID:7];
        [self workstation:CGPointMake(s.frame.size.width/4, -s.frame.size.height/2.4) scale:0.6 nodeToAttatch:s stationID:8];
        [self workstation:CGPointMake(-s.frame.size.width/4, -s.frame.size.height/2.4) scale:0.6 nodeToAttatch:s stationID:9];
    }
}
+(void)setUsableWorkstationAmount: (int)value {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    [nd setInteger:value forKey:@"workstation_active"];
    [nd synchronize];
}
+(int)getUsableWorkstations {
    return [candyMachines getCandyMachinesUnlocked];
}
+(NSString*)getWorkstationAtIndex: (int)index {
    return [[self getWorkstationTypes] objectAtIndex:index];
}
+(int)getAmountOfWorkstations {
    return (int)( [[self getWorkstationTypes] count] - 1 );
}
+(NSMutableArray*)getOwnedWorkstationsByID {
    NSMutableArray *workstationArray;
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSData *arrayToData = [nd objectForKey:@"ownedWorkstations"];
    
    if(arrayToData == nil){
        workstationArray = [[NSMutableArray alloc] init];
        arrayToData = [[NSData alloc] init];
    }
    
    workstationArray = [NSKeyedUnarchiver unarchiveObjectWithData:arrayToData];
    return workstationArray;
}
+(void)addNewWorkstationToList: (int)workstationID {
    NSUserDefaults *nd = [NSUserDefaults standardUserDefaults];
    NSMutableArray *workstations = [self getOwnedWorkstationsByID];
    
    if(workstations == nil){
        workstations = [[NSMutableArray alloc] init];
    }
    
    NSNumber *newWorkstation = [NSNumber numberWithInt:workstationID];
    
    [workstations addObject:newWorkstation];
    
    NSData *arrayToData = [NSKeyedArchiver archivedDataWithRootObject:workstations];
    
    [nd setObject:arrayToData forKey:@"ownedWorkstations"];
    [nd synchronize];
}
+(bool)doesOwnWorkstation: (int)workstationID {
    NSNumber *inputID = [NSNumber numberWithUnsignedInt:workstationID];
    
    if([[self getOwnedWorkstationsByID] containsObject:inputID]){
        
        return true;
    }else {
        return false;
    }
}
@end
