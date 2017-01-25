//
//  sweetValueCalculation.m
//  Candy
//
//  Created by Callum Beckwith on 30/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetValueCalculation.h"
#import "bonbonPacket.h"
#import "bonbonPacket.h"
#import "lollyPacket.h"
#import "wrappedPacket.h"
#import "chewPacket.h"
#import "jawbreakerPacket.h"
#import "trendsData.h"

@implementation sweetValueCalculation

+(NSMutableArray*)sweetPriceDataArray {
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    int default_grey_per_tap = 2;
    int default_blue_per_tap = 5;
    int default_red_per_tap = 20;
    int default_yellow_per_tap = 100;
    
    //I mean they can all be put into an array and a for loop but if we do it this way then we can set the exact prices so if the trend of a certain sweet goes up we can increase its price!
    int bonbonTrend = [trendsData getTrendMultiplierByPacketTrendID:3];
    [self addSweetSaleData:@"bonbonMint" sellingPrice:default_grey_per_tap * [bonbonPacket getBrandValue] * bonbonTrend array:dataArray];
    [self addSweetSaleData:@"bonbonLime" sellingPrice:default_grey_per_tap * [bonbonPacket getBrandValue] * bonbonTrend array:dataArray];
    [self addSweetSaleData:@"bonbonCola" sellingPrice:default_grey_per_tap * [bonbonPacket getBrandValue] * bonbonTrend array:dataArray];
    [self addSweetSaleData:@"bonbonStrawberry" sellingPrice:default_blue_per_tap * [bonbonPacket getBrandValue] * bonbonTrend array:dataArray];
    [self addSweetSaleData:@"bonbonLemon" sellingPrice:default_blue_per_tap * [bonbonPacket getBrandValue] * bonbonTrend array:dataArray];
    [self addSweetSaleData:@"bonbonBubblegum" sellingPrice:default_blue_per_tap * [bonbonPacket getBrandValue] * bonbonTrend array:dataArray];
    [self addSweetSaleData:@"bonbonTropical" sellingPrice:default_red_per_tap * [bonbonPacket getBrandValue] * bonbonTrend array:dataArray];
    [self addSweetSaleData:@"bonbonCherry" sellingPrice:default_red_per_tap * [bonbonPacket getBrandValue] * bonbonTrend array:dataArray];
    [self addSweetSaleData:@"bonbonRainbow" sellingPrice:default_yellow_per_tap * [bonbonPacket getBrandValue] * bonbonTrend array:dataArray];
    
    int chewTrend = [trendsData getTrendMultiplierByPacketTrendID:2];
    [self addSweetSaleData:@"chewOrange" sellingPrice:default_grey_per_tap * [chewPacket getBrandValue] * chewTrend array:dataArray];
    [self addSweetSaleData:@"chewCherry" sellingPrice:default_grey_per_tap * [chewPacket getBrandValue] * chewTrend array:dataArray];
    [self addSweetSaleData:@"chewVanilla" sellingPrice:default_grey_per_tap * [chewPacket getBrandValue] * chewTrend array:dataArray];
    [self addSweetSaleData:@"chewBubblegum" sellingPrice:default_blue_per_tap * [chewPacket getBrandValue] * chewTrend array:dataArray];
    [self addSweetSaleData:@"chewApple" sellingPrice:default_blue_per_tap * [chewPacket getBrandValue] * chewTrend array:dataArray];
    [self addSweetSaleData:@"chewSourLime" sellingPrice:default_blue_per_tap * [chewPacket getBrandValue] * chewTrend array:dataArray];
    [self addSweetSaleData:@"chewCandyfloss" sellingPrice:default_red_per_tap * [chewPacket getBrandValue] * chewTrend array:dataArray];
    [self addSweetSaleData:@"chewBanana" sellingPrice:default_red_per_tap * [chewPacket getBrandValue] * chewTrend array:dataArray];
    [self addSweetSaleData:@"chewFizzyCola" sellingPrice:default_yellow_per_tap * [chewPacket getBrandValue] * chewTrend array:dataArray];
    
    int wrappedTrend = [trendsData getTrendMultiplierByPacketTrendID:4];
    [self addSweetSaleData:@"wrappedMint" sellingPrice:default_grey_per_tap * [wrappedPacket getBrandValue] * wrappedTrend array:dataArray];
    [self addSweetSaleData:@"wrappedLime" sellingPrice:default_grey_per_tap * [wrappedPacket getBrandValue] * wrappedTrend array:dataArray];
    [self addSweetSaleData:@"wrappedCoffee" sellingPrice:default_grey_per_tap * [wrappedPacket getBrandValue] * wrappedTrend array:dataArray];
    [self addSweetSaleData:@"wrappedLemon" sellingPrice:default_blue_per_tap * [wrappedPacket getBrandValue] * wrappedTrend array:dataArray];
    [self addSweetSaleData:@"wrappedCherry" sellingPrice:default_blue_per_tap * [wrappedPacket getBrandValue] * wrappedTrend array:dataArray];
    [self addSweetSaleData:@"wrappedStrawberry" sellingPrice:default_blue_per_tap * [wrappedPacket getBrandValue] * wrappedTrend array:dataArray];
    [self addSweetSaleData:@"wrappedOrange" sellingPrice:default_red_per_tap * [wrappedPacket getBrandValue] * wrappedTrend array:dataArray];
    [self addSweetSaleData:@"wrappedBlueberry" sellingPrice:default_red_per_tap * [wrappedPacket getBrandValue] * wrappedTrend array:dataArray];
    [self addSweetSaleData:@"wrappedTropical" sellingPrice:default_yellow_per_tap * [wrappedPacket getBrandValue] * wrappedTrend array:dataArray];
    
    int jawbreakerTrend = [trendsData getTrendMultiplierByPacketTrendID:1];
    [self addSweetSaleData:@"jawbreakerLiquorice" sellingPrice:default_grey_per_tap * [jawbreakerPacket getBrandValue] * jawbreakerTrend array:dataArray];
    [self addSweetSaleData:@"jawbreakerLime" sellingPrice:default_grey_per_tap * [jawbreakerPacket getBrandValue] * jawbreakerTrend array:dataArray];
    [self addSweetSaleData:@"jawbreakerLemon" sellingPrice:default_grey_per_tap * [jawbreakerPacket getBrandValue] * jawbreakerTrend array:dataArray];
    [self addSweetSaleData:@"jawbreakerBlueberry" sellingPrice:default_blue_per_tap * [jawbreakerPacket getBrandValue] * jawbreakerTrend array:dataArray];
    [self addSweetSaleData:@"jawbreakerStrawberry" sellingPrice:default_blue_per_tap * [jawbreakerPacket getBrandValue] * jawbreakerTrend array:dataArray];
    [self addSweetSaleData:@"jawbreakerOrange" sellingPrice:default_blue_per_tap * [jawbreakerPacket getBrandValue] * jawbreakerTrend array:dataArray];
    [self addSweetSaleData:@"jawbreakerCandyfloss" sellingPrice:default_red_per_tap * [jawbreakerPacket getBrandValue] * jawbreakerTrend array:dataArray];
    [self addSweetSaleData:@"jawbreakerBubblegum" sellingPrice:default_red_per_tap * [jawbreakerPacket getBrandValue] * jawbreakerTrend array:dataArray];
    [self addSweetSaleData:@"jawbreakerWatermelon" sellingPrice:default_yellow_per_tap * [jawbreakerPacket getBrandValue] * jawbreakerTrend array:dataArray];
    
    int lollyTrend = [trendsData getTrendMultiplierByPacketTrendID:0];
    [self addSweetSaleData:@"lollyMint" sellingPrice:default_grey_per_tap * [lollyPacket getBrandValue] * lollyTrend array:dataArray];
    [self addSweetSaleData:@"lollyLime" sellingPrice:default_grey_per_tap * [lollyPacket getBrandValue] * lollyTrend array:dataArray];
    [self addSweetSaleData:@"lollyLemon" sellingPrice:default_grey_per_tap * [lollyPacket getBrandValue] * lollyTrend array:dataArray];
    [self addSweetSaleData:@"lollyCola" sellingPrice:default_blue_per_tap * [lollyPacket getBrandValue] * lollyTrend array:dataArray];
    [self addSweetSaleData:@"lollyOrange" sellingPrice:default_blue_per_tap * [lollyPacket getBrandValue] * lollyTrend array:dataArray];
    [self addSweetSaleData:@"lollyStrawberry" sellingPrice:default_blue_per_tap * [lollyPacket getBrandValue] * lollyTrend array:dataArray];
    [self addSweetSaleData:@"lollyCherry" sellingPrice:default_red_per_tap * [lollyPacket getBrandValue] * lollyTrend array:dataArray];
    [self addSweetSaleData:@"lollySherbert" sellingPrice:default_red_per_tap * [lollyPacket getBrandValue] * lollyTrend array:dataArray];
    [self addSweetSaleData:@"lollySourApple" sellingPrice:default_yellow_per_tap * [lollyPacket getBrandValue] * lollyTrend array:dataArray];
    
    return dataArray;
}

+(void)addSweetSaleData: (NSString*)sweetTextureName sellingPrice:(int)value array:(NSMutableArray*)dataArray {
    NSMutableDictionary *sweetPriceData = [[NSMutableDictionary alloc] init];
    NSNumber *price = [NSNumber numberWithInt:value];
    
    [sweetPriceData setObject:sweetTextureName forKey:@"spd_texture"];
    [sweetPriceData setObject:price forKey:@"spd_price"];
    
    [dataArray addObject:sweetPriceData];
}

+(int)calculateSkValue: (SKSpriteNode*)sweetNode {
    
    NSMutableArray *sweetPriceDataArray = [self sweetPriceDataArray];
    NSString *sweetNodeName = ([NSString stringWithFormat:@"%@", [sweetNode texture]]);

    int noOfDataEntries = (int)[sweetPriceDataArray count] - 1;
    
    for(int i = 0; i <= noOfDataEntries; i++){
        
        NSMutableDictionary *sweetPriceData = [sweetPriceDataArray objectAtIndex:i];
        NSString *sweetTextureName = [sweetPriceData objectForKey:@"spd_texture"];
        
        NSString *formattedTexture = [NSString stringWithFormat:@"<SKTexture> '%@' (280 x 280)", sweetTextureName];
        
        if([sweetNodeName isEqualToString:formattedTexture]){

            NSNumber *price = [sweetPriceData objectForKey:@"spd_price"];
            int intPrice = [price intValue];
            return intPrice;
        }
    }
    return 0;
}
+(int)calculateTextureValue: (NSString*)sweetTextureName {
    
    NSMutableArray *sweetPriceDataArray = [self sweetPriceDataArray];

    int noOfDataEntries = (int)[sweetPriceDataArray count] - 1;
    
    for(int i = 0; i <= noOfDataEntries; i++){
        
        NSMutableDictionary *sweetPriceData = [sweetPriceDataArray objectAtIndex:i];
        NSString *sweetDataTextureName = [sweetPriceData objectForKey:@"spd_texture"];
        
        
        if([sweetTextureName isEqualToString:sweetDataTextureName]){
            
            NSNumber *price = [sweetPriceData objectForKey:@"spd_price"];
            int intPrice = [price intValue];
            return intPrice;
        }
    }
    return 0;
}

@end
