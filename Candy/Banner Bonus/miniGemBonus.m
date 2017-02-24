//
//  miniGemBonus.m
//  Candy
//
//  Created by Callum Beckwith on 24/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "miniGemBonus.h"
#import "gems.h"

@implementation miniGemBonus

+(void)createMiniGemBonusBar:(UIView*)v bannerView:(UIView*)banner {
    float gemW = v.frame.size.width/6;
    float gemH = v.frame.size.height/12;
    UIView *gemMain = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width, banner.frame.origin.y - gemH, gemW, gemH)];
    
    UIImage *miniGem = [UIImage imageNamed:@"miniGems"];
    UIImage *backing = [UIImage imageNamed:@"miniGemBonus"];
    
    UIImageView *miniGemView = [[UIImageView alloc] initWithImage:miniGem];
    UIImageView *backingView = [[UIImageView alloc] initWithImage:backing];
    
    [backingView setFrame:CGRectMake(0, 0, gemW, gemH)];
    [miniGemView setFrame:CGRectMake(gemW/8, 0, gemW, gemH)];
    
    miniGemView.alpha = 0.0;
    
    [gemMain addSubview:backingView];
    [gemMain addSubview:miniGemView];
    
    [gemMain setTag:1344];
    
    [v addSubview:gemMain];
    
    [UIView animateWithDuration:0.3 animations:^{
        [gemMain setFrame:CGRectMake(v.frame.size.width - gemW, banner.frame.origin.y - gemH, gemW, gemH)];
    } completion:^(BOOL finished){
        [UIView animateWithDuration:10 animations:^{
            miniGemView.alpha = 1;
        } completion:^(BOOL finished){
            [UIView animateWithDuration:2 animations:^{
                [miniGemView setFrame:CGRectMake(gemW/8, -gemH*4, gemW, gemH)];
                [miniGemView setAlpha:0.0];
                [gems addMiniGems:1];
            } completion:^(BOOL finished){
                [UIView setAnimationRepeatCount:2];
                [UIView animateWithDuration:0.3 animations:^{
                    [gemMain setFrame:CGRectMake(v.frame.size.width, banner.frame.origin.y - gemH, gemW, gemH)];
                } completion:^(BOOL finished){
                    [gemMain removeFromSuperview];
                }];
            }];
        }];
    }];
}

@end
