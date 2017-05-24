//
//  specialsUI.m
//  Candy
//
//  Created by Callum Beckwith on 06/03/2017.
//  Copyright © 2017 Kilcal. All rights reserved.
//

#import "specialsUI.h"
#import "specialsItem.h"
#import "specialsData.h"
#import "specialsItemUi.h"

@implementation specialsUI

+(void)createSpecialsMenu: (UIView*)v {
    UIView *mainSpec = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    
    UIImage *backdropI = [UIImage imageNamed:@"sp_backdrop"];
    UIImage *titleI = [UIImage imageNamed:@"sp_title"];
    UIImage *contentPaneI = [UIImage imageNamed:@"sp_content"];
    UIImage *cross = [UIImage imageNamed:@"crossButton"];
    
    UIImageView *backing = [[UIImageView alloc] initWithImage:backdropI];
    UIImageView *title = [[UIImageView alloc] initWithImage:titleI];
    UIImageView *content = [[UIImageView alloc] initWithImage:contentPaneI];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backing setFrame:v.frame];
    [title setFrame:CGRectMake(v.frame.size.width/2 - (v.frame.size.width/1.6)/2, v.frame.size.height/16, v.frame.size.width/1.6, v.frame.size.height/13)];
    [content setFrame:CGRectMake(v.frame.size.width/2 - (v.frame.size.width/1.3)/2, v.frame.size.height/4, v.frame.size.width/1.3, v.frame.size.height/1.8)];
    [backing setUserInteractionEnabled:YES];
    [backButton setImage:cross forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(0, 0, mainSpec.frame.size.width/8, mainSpec.frame.size.width/8)];
    [backButton addTarget:self action:@selector(onBackPress:) forControlEvents:UIControlEventTouchUpInside];
    
    [content setUserInteractionEnabled:YES];
    
    UIScrollView *contentScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, content.frame.size.height/40, content.frame.size.width, content.frame.size.height/1.05)];
    [specialsItem createSpecialItemPane:contentScroll];
    
    if([specialsData getSpecialActiveWithID] != -1){
        [specialsItemUi itemActiveScene:content activeItemID:[specialsData getSpecialActiveWithID]];
    }else{
            [content addSubview:contentScroll];
    }
    [mainSpec addSubview:backing];
    [mainSpec addSubview:title];
    [mainSpec addSubview:content];
    [mainSpec addSubview:backButton];
    
    [mainSpec setAlpha:0.0];
    [v addSubview:mainSpec];
    
    [UIView animateWithDuration:0.3 animations:^{
        [mainSpec setAlpha:1.0];
        [mainSpec setFrame:v.frame];
    }];
     
}
+(void)onBackPress: (id)sender {
    UIButton *back = (UIButton*)sender;
    UIView *v = [back superview];
    
    [UIView animateWithDuration:0.3 animations:^{
        [v setAlpha:0];
        [v setFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    } completion:^(BOOL finished){
        [v removeFromSuperview];
    }];
}
@end
