//
//  sweetInventoryScrollUI.m
//  Candy
//
//  Created by Callum Beckwith on 21/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "sweetInventoryScrollUI.h"
#import "sweetInventorySlot.h"
#import "sweetInventoryData.h"

@implementation sweetInventoryScrollUI

+(void)addScrollUI: (UIView*)v{
    UIScrollView *scrollUI = [[UIScrollView alloc] initWithFrame:CGRectMake(0, v.frame.size.height/4.5, v.frame.size.width, v.frame.size.height - v.frame.size.height/4.5 - v.frame.size.height/6)];
    float iconsWitdh = v.frame.size.width/4 + v.frame.size.width/16;
    scrollUI.contentSize = CGSizeMake(([sweetInventoryData rowAmount] * iconsWitdh) + iconsWitdh/2, scrollUI.frame.size.height);
    scrollUI.backgroundColor = [UIColor clearColor];
    [sweetInventorySlot addSlots:scrollUI];
    [v addSubview:scrollUI];
}

@end
