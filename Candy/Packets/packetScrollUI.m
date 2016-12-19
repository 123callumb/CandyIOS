//
//  packetScrollUI.m
//  Candy
//
//  Created by Callum Beckwith on 11/12/2016.
//  Copyright © 2016 Kilcal. All rights reserved.
//

#import "packetScrollUI.h"
#import "packetInventoryData.h"
#import "packetInventroySlot.h"

@implementation packetScrollUI

+(void)addScrollUI: (UIView*)v {
    UIScrollView *ui = [[UIScrollView alloc] initWithFrame:CGRectMake(0, v.frame.size.height/4.7, v.frame.size.width, v.frame.size.height/1.55)];
    ui.backgroundColor = [UIColor colorWithRed:120.0f/255.0f green:185.0f/255.0f blue:219.0/255.0f alpha:1];
    ui.tag = 2000;
    ui.contentSize = CGSizeMake(ui.frame.size.width, v.frame.size.width/3 * 16);
    [packetInventroySlot addSlots:ui];
    [v addSubview:ui];
    

}

@end
