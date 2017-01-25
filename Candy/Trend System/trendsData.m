//
//  trendsData.m
//  Candy
//
//  Created by Callum Beckwith on 23/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "trendsData.h"
#import "trendsGenerator.h"
@implementation trendsData
+(NSMutableArray*)trendsArray {
    NSMutableArray *trendsArray = [[NSMutableArray alloc] init];
    [self addTrendsToArray:trendsArray];
    return trendsArray;
}
+(void)addTrendsToArray: (NSMutableArray*)m {
    
    [self createTrendChartItem:m sweetTexture:@"lollyPacket" trend:4];
    [self createTrendChartItem:m sweetTexture:@"jawbreakerPacket" trend:[trendsGenerator generateRandomTrend]];
    [self createTrendChartItem:m sweetTexture:@"chewPacket" trend:5];
    [self createTrendChartItem:m sweetTexture:@"bonbonPacket" trend:2];
    [self createTrendChartItem:m sweetTexture:@"sweetPacket" trend:1];

}
+(void)createTrendChartItem: (NSMutableArray*)m sweetTexture:(NSString*)texture trend:(int)trendLevel {
    NSMutableDictionary *trendItem = [[NSMutableDictionary alloc] init];
    [trendItem setObject:texture forKey:@"trend_texture"];
   
    if(trendLevel != 0 && trendLevel < 6){
        [trendItem setObject:[NSString stringWithFormat:@"trendBar_%d", trendLevel] forKey:@"trend_level"];
    }else {
        [trendItem setObject:@"trendBar_1" forKey:@"trend_level"];
    }
    
    [m addObject:trendItem];
}
+(NSString*)getTrendTextureAtIndex: (int)input {
    NSMutableDictionary *item = [[self trendsArray] objectAtIndex:input];
    
    if(item == nil){
            return @"trend does not exist";
    }else {
        return [item objectForKey:@"trend_texture"];
    }
}
+(NSString*)getTrendAtIndex: (int)input {
    NSMutableDictionary *item = [[self trendsArray] objectAtIndex:input];
    
    if(item == nil){
        return @"trend does not exist";
    }else {
        return [item objectForKey:@"trend_level"];
    }
}
+(int)amountOfTrends {
    return (int)[[self trendsArray] count] - 1;
}
@end
