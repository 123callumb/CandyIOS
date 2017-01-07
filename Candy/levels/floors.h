//
//  floors.h
//  Candy
//
//  Created by Callum Beckwith on 05/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface floors : NSObject
+(NSString*)getCurrentFloor;
+(NSString*)getFloorAtIndex: (int)index;
+(int)getAmountOfFloors;
+(void)addNewFloorToList: (int)floorID;
+(bool)doesOwnFloor: (int)floorID;
+(void)setCurrentFloorID: (int)floorID;
@end
