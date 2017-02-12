//
//  itemPacksUI.m
//  Candy
//
//  Created by Callum Beckwith on 12/02/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "itemPacksUI.h"

@implementation itemPacksUI

+(void)createItemPackUI: (UIView*)v {
    UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    UIImage *packBGImage = [UIImage imageNamed:@"packsBG"];
    UIImage *packHeaderImage = [UIImage imageNamed:@"packsHeader"];
    UIImageView *packBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height)];
    UIImageView *packHeader = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, mainView.frame.size.width, mainView.frame.size.height/5)];
    [packBG setImage:packBGImage];
    [packHeader setImage:packHeaderImage];
    
    [mainView addSubview:packBG];
    [mainView addSubview:packHeader];
    [mainView setAlpha:0.0];
    [self addBackButton:mainView];
    
    [v addSubview:mainView];
    
    [UIView animateWithDuration:0.3 animations:^{
        [mainView setAlpha:1];
        [mainView setFrame:v.frame];
    }];
}
+(void)addBackButton: (UIView*)v {
    UIImage *backImage = [UIImage imageNamed:@"crossButton"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:backImage forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onBackPress:) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, v.frame.size.width/7.5, v.frame.size.width/7.5)];
    
    [v addSubview:button];
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
