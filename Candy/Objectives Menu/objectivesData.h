//
//  objectivesData.h
//  Candy
//
//  Created by Callum Beckwith on 15/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface objectivesData : NSObject
+(NSMutableArray*)goldObjs;
+(NSMutableArray*)silverObjs;
+(NSMutableArray*)bronzeObjs;
+(int)getGoldProgress;
+(int)getSilverProgress;
+(int)getBronzeProgress;
+(void)setGoldProgress: (int)value;
+(void)setSilverProgress: (int)value;
+(void)setBronzeProgress: (int)value;
@end
