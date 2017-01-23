//
//  trendsChart.m
//  Candy
//
//  Created by Callum Beckwith on 23/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "trendsChart.h"
#import "trendsData.h"

@implementation trendsChart
+(void)addChartView: (UIView*)v {
    UIScrollView *chart = [[UIScrollView alloc] initWithFrame:
                           CGRectMake(v.frame.size.width/2.575,
                                      v.frame.size.height/4.8,
                                      v.frame.size.width/1.82,
                                      v.frame.size.height/2.35)];
    
    chart.contentSize = CGSizeMake(chart.frame.size.width/4 * ([trendsData amountOfTrends]+1), chart.frame.size.width);
    [self addBarsToChart:chart];
    [chart setUserInteractionEnabled:true];
    [v addSubview:chart];
}
+(void)addBarsToChart: (UIScrollView*)v {
    for(int i = 0; i <= [trendsData amountOfTrends]; i++){
        [self createBar:v trendID:i];
    }
}
+(void)createBar: (UIScrollView*)v trendID:(int)trendNo {
    
    UIView *trendBar = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width/4 * trendNo, 0, v.frame.size.width/4, v.frame.size.height)];
    UIImage *barImage = [UIImage imageNamed:[trendsData getTrendAtIndex:trendNo]];
    UIImage *sweetTexture = [UIImage imageNamed:[trendsData getTrendTextureAtIndex:trendNo]];
    UIImageView *bar = [[UIImageView alloc] initWithImage:barImage];
    UIImageView *sweet = [[UIImageView alloc] initWithImage:sweetTexture];
    
    bar.frame = CGRectMake(trendBar.frame.size.width/2 - (barImage.size.width * 0.22)/2,
                           trendBar.frame.size.height - barImage.size.height * 0.22,
                           barImage.size.width * 0.22,
                           barImage.size.height * 0.22);
    
    sweet.frame = CGRectMake(trendBar.frame.size.width/2 - (sweetTexture.size.width * 0.1)/2,
                             trendBar.frame.size.height - barImage.size.height * 0.22 - sweetTexture.size.height *0.05,
                             sweetTexture.size.width * 0.1,
                             sweetTexture.size.height * 0.1);
    
    [trendBar addSubview:bar];
    [trendBar addSubview:sweet];
    
    [v addSubview:trendBar];
}
@end
