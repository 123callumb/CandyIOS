//
//  trendsMain.m
//  Candy
//
//  Created by Callum Beckwith on 20/01/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "trendsMain.h"
#import "trendsChart.h"

@implementation trendsMain
+(void)createTrendsMenu: (UIView*)v {
    
    UIView *mainTrendUI = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    
    UIImage *bgImage = [UIImage imageNamed:@"trendBG"];
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
    [bg setImage:bgImage];
    
    UIImage *hederImage = [UIImage imageNamed:@"trendsHeader"];
    UIImageView *header = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height/8)];
    [header setImage:hederImage];
    
    UIImage *mainBodyImage = [UIImage imageNamed:@"trendMain"];
    UIImageView *mainBody = [[UIImageView alloc] initWithFrame:CGRectMake(v.frame.size.width/2 - (v.frame.size.width/2), v.frame.size.height/7, v.frame.size.width, v.frame.size.height/1.2)];
    [mainBody setImage:mainBodyImage];
    
    [bg setUserInteractionEnabled:true];
    [mainTrendUI addSubview:bg];
    [mainTrendUI addSubview:header];
    [mainTrendUI addSubview:mainBody];
    [trendsChart addChartView:mainTrendUI];
    [self addBackButton:mainTrendUI];
    
    [mainTrendUI setAlpha:0.0];
    [v addSubview:mainTrendUI];
    
    [UIView animateWithDuration:0.3 animations:^{
        [mainTrendUI setAlpha:1];
        [mainTrendUI setFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
    }];
    
}
+(void)addBackButton: (UIView*)v {
    UIImage *backButtonImage = [UIImage imageNamed:@"backButton"];
    UIImage *backButtonImageDown = [UIImage imageNamed:@"backButtonPressure"];
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setFrame:CGRectMake(v.frame.size.width/2 - backButtonImage.size.width*0.22/2, v.frame.size.height/1.2, backButtonImage.size.width*0.22, backButtonImage.size.height*0.22)];
    [back setImage:backButtonImage forState:UIControlStateNormal];
    [back setImage:backButtonImageDown forState:UIControlStateHighlighted];
    [back addTarget:self action:@selector(onBackPress:) forControlEvents:UIControlEventTouchUpInside];
    [v addSubview:back];
}
+(void)onBackPress: (id)sender {
    UIButton *button = (UIButton*)sender;
    UIView *v = [button superview];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        [v setAlpha:0];
        [v setFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    } completion:^(BOOL finished){
        [v removeFromSuperview];
    }];
}

@end
