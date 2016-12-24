//
//  sweetInventoryScrollUI.m
//  Candy
//
//  Created by Callum Beckwith on 21/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetInventoryScrollUI.h"
#import "sweetInventorySlot.h"

@implementation sweetInventoryScrollUI

+(void)addScrollUI: (UIView*)v{
    UIScrollView *scrollUI = [[UIScrollView alloc] initWithFrame:CGRectMake(0, v.frame.size.height/4.5, v.frame.size.width, v.frame.size.height - v.frame.size.height/4.5 - v.frame.size.height/6)];
    scrollUI.contentSize = CGSizeMake(v.frame.size.width*2, scrollUI.frame.size.height);
    scrollUI.backgroundColor = [UIColor colorWithRed:120.0f/255.0f green:185.0f/255.0f blue:219.0/255.0f alpha:1];
    [sweetInventorySlot addSlots:scrollUI];
    [v addSubview:scrollUI];
}

@end
