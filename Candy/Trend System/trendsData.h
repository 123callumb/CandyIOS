//
//  trendsData.h
//  Candy
//
//  Created by Callum Beckwith on 23/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface trendsData : NSObject
+(NSString*)getTrendTextureAtIndex: (int)input;
+(NSString*)getTrendAtIndex: (int)input;
+(int)amountOfTrends;
+(int)getTrendMultiplierByPacketTrendID: (int)s;
+(void)keepTrendsUpdated;
@end
