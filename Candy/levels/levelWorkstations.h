//
//  levelWorkstations.h
//  Candy
//
//  Created by Callum Beckwith on 05/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface levelWorkstations : SKSpriteNode
+(void)addWorkstations: (SKSpriteNode*)s;
+(NSString*)getWorkstationAtIndex: (int)index;
+(void)setCurrentWorkstationID: (int)buildingID;
+(int)getAmountOfWorkstations;
+(NSMutableArray*)getOwnedWorkstationsByID;
+(void)addNewWorkstationToList: (int)workstationID;
+(bool)doesOwnWorkstation: (int)workstationID;
+(void)setUsableWorkstationAmount: (int)value ;
+(int)getUsableWorkstations ;
@end
