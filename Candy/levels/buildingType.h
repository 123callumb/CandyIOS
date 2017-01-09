//
//  buildingType.h
//  Candy
//
//  Created by Callum Beckwith on 05/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface buildingType : SKSpriteNode
+(void)setCurrentBuildingID: (int)buildingID;
+(int)getCurrentBuildingID;
+(NSString*)getCurrentBuildingWall;
+(NSString*)getCurrentBuilding;
+(NSString*)getCurrentBuildingName;
+(NSString*)getNextBuildingName;
+(NSString*)getNextBuilding;
+(int)getNextBuildingPrice;
@end
