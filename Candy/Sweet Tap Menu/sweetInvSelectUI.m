//
//  sweetInvSelectUI.m
//  Candy
//
//  Created by Callum Beckwith on 29/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetInvSelectUI.h"

@implementation sweetInvSelectUI
+(void)createMenu: (UIView*)v {
    float uiWidth = v.frame.size.width/1.04;
    float uiHeight = v.frame.size.height/1.38;
    
    UIView *drawUI = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width/2 - uiWidth/2, v.frame.size.height/5.7, uiWidth, uiHeight)];
    
    UIImage *backgroundImage = [UIImage imageNamed:@"selectSlotBg"];
    UIImageView *backing = [[UIImageView alloc] initWithImage:backgroundImage];
    
    backing.frame = CGRectMake(0, 0, drawUI.frame.size.width, drawUI.frame.size.height);
    
    drawUI.tag = 10000;
    
    [drawUI addSubview:backing];
    
    [v addSubview:drawUI];
}
+(void)removeMenu: (UIView*)v {
    UIView *drawUI = (UIView*)[v viewWithTag:10000];
    [drawUI removeFromSuperview];
}


@end
