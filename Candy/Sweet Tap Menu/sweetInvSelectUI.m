//
//  sweetInvSelectUI.m
//  Candy
//
//  Created by Callum Beckwith on 29/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetInvSelectUI.h"
#import "drawInventorySelector.h"
#import "sweetDrawUI.h"

@implementation sweetInvSelectUI
+(void)createMenu: (UIView*)v {
    float uiWidth = v.frame.size.width/1.04;
    float uiHeight = v.frame.size.height/1.38;
    
    UIView *drawUI = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width/2 - uiWidth/2, v.frame.size.height/5.7, uiWidth, uiHeight)];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"sweetInvSelectBg"];
    UIImageView *backing = [[UIImageView alloc] initWithImage:backgroundImage];
    
    backing.frame = CGRectMake(0, 0, drawUI.frame.size.width, drawUI.frame.size.height);
    
    drawUI.tag = 13000;

    [drawUI addSubview:backing];
    [drawInventorySelector createInvSelectionUI:drawUI];
    [self addBackButton:drawUI];
    
    [v addSubview:drawUI];
}
+(void)removeMenu: (UIView*)v {
    UIView *drawUI = (UIView*)[v viewWithTag:13000];
    [drawUI removeFromSuperview];
}
+(void)addBackButton: (UIView*)v {
    float uiWidth = v.frame.size.width/2.5;
    float uiHeight = v.frame.size.height/12;
    
    UIImage *buttonImage = [UIImage imageNamed:@"redBackButton"];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(v.frame.size.width/2 - uiWidth/2, v.frame.size.height/1.29, uiWidth, uiHeight)];
    
    [backButton setImage:buttonImage forState:UIControlStateNormal];
    
    SEL backAction = @selector(onBackPress:);
    
    [backButton addTarget:self action:backAction forControlEvents:UIControlEventTouchUpInside];
    
    [v addSubview:backButton];
}
+(void)onBackPress: (id)sender {
    UIButton *backButton = (UIButton*)sender;
    UIView *v = [backButton superview];
    
    [self removeMenu:v];
}

@end
