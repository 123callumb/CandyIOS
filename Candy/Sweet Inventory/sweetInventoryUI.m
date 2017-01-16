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
    UIView *main = [[UIView alloc] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
    main.tag = 4000;
    
    [sweetInventoryBackground addItems:main];
    [sweetInventoryScrollUI addScrollUI:main];

    [v addSubview:main];
}
+(void)showSweetInventoryUI:(UIView*)v {
        [self createUI:v];
}
+(void)hideSweetInventoryUI: (UIView*)v {
    UIView *ui = (UIView*)[v viewWithTag:4000];
    [ui removeFromSuperview];
}
+(void)refreshView: (UIView*)v {
    [self hideSweetInventoryUI:v];
    [self showSweetInventoryUI:v];
}
@end
