//
//  sweetInventoryUI.m
//  Candy
//
//  Created by Callum Beckwith on 20/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetInventoryUI.h"
#import "sweetInventoryBackground.h"
#import "sweetInventoryScrollUI.h"

@implementation sweetInventoryUI

+(void)createUI: (UIView*)v {
    UIView *main = [[UIView alloc] initWithFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
    main.tag = 4000;
    
    [sweetInventoryBackground addItems:main];
    [sweetInventoryScrollUI addScrollUI:main];
    
    [main setAlpha:0.0];
    [v addSubview:main];
    
    [UIView animateWithDuration:0.3 animations:^{
        [main setFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
        [main setAlpha:1];
    }];
    
}
+(void)showSweetInventoryUI:(UIView*)v {
        [self createUI:v];
}
+(void)hideSweetInventoryUI: (UIView*)v {
    UIView *ui = (UIView*)[v viewWithTag:4000];
    
    [UIView animateWithDuration:0.3 animations:^{
        [ui setFrame:CGRectMake(v.frame.size.width, 0, v.frame.size.width, v.frame.size.height)];
        [ui setAlpha:0.0];
    } completion:^(BOOL finished){
        [ui removeFromSuperview];
    }];
}
+(void)refreshView: (UIView*)v {
    [self hideSweetInventoryUI:v];
    [self showSweetInventoryUI:[v superview]];
}
@end
