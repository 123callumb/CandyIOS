//
//  scrollUpdate.m
//  Candy
//
//  Created by Killian Comerford on 06/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "scrollUpdate.h"

@implementation scrollUpdate

+(void)initializeScroll:(UIScrollView*)s uiView:(UIView*)v{
    [s setContentSize:CGSizeMake(s.frame.size.width, 900)];
    s.backgroundColor = [UIColor colorWithRed:121.0f/255.0f green:75.0f/255.0f blue:148.0f/255.0f alpha:1];
    s.tag = 1;
    s.hidden = true;
}
+(void)Show:(UIView*)v{
    UIScrollView *updateView = (UIScrollView*)[v viewWithTag:1];
    updateView.hidden = false;
}
+(void)Hide:(UIView*)v{
    UIScrollView *updateView = (UIScrollView*)[v viewWithTag:1];
    updateView.hidden = true;
}


@end
